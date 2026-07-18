import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doza_flutter/data/services/auth_api_client.dart';
import 'package:doza_flutter/data/services/auth_state_notifier.dart';
import 'package:doza_flutter/data/services/models/auth/auth_register_api_model/auth_register_api_model.dart';
import 'package:doza_flutter/enums/constants.dart';
import 'package:doza_flutter/ui/screens/auth/view_models/utils.dart';
import 'package:doza_flutter/utils/get_device_id.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authApiClient, this._storage, this._authStateNotifier);

  final String _host = dotenv.env['SERVER_IP'] ?? '10.0.2.2';
  final int _port = dotenv.env['SERVER_PORT'] != null
      ? (int.tryParse(dotenv.env['SERVER_PORT']!) ?? 4000)
      : 4000;
  String get _baseUrl => 'http://$_host:$_port';

  final Dio _dio = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5)));
  final AuthApiClient _authApiClient;
  final FlutterSecureStorage _storage;
  final AuthStateNotifier _authStateNotifier;
  final Logger _log = Logger('Auth interceptor');

  bool _isRefreshing = false;

  /// Кэшируем deviceId чтобы не обращаться к platform channel на каждый запрос
  String? _cachedDeviceId;

  Future<String> _getDeviceId() async {
    _cachedDeviceId ??= await getDeviceId();
    return _cachedDeviceId!;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final privateKey = await _storage.read(key: ConstantsEnum.privateKey.value);
    final authPayload = await _storage.read(
      key: ConstantsEnum.authPayload.value,
    );

    // При отсутствии приватного ключа пользователь должен пройти аутентификацию через экран авторизации
    if (privateKey == null) {
      _log.warning(
        '🔒 privateKey is null — forcing logout. URL: ${options.uri}',
      );
      _authStateNotifier.logout();
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.cancel,
          message: 'Not authenticated',
        ),
      );
    }
    if (authPayload != null) {
      final Map<String, dynamic> payloadData = jsonDecode(authPayload);
      final String? accessToken = payloadData['accessToken'];
      if (accessToken != null) {
        options.headers['Authorization'] = accessToken;
      } else {
        _log.warning(
          '⚠️ authPayload exists but accessToken is null. URL: ${options.uri}',
        );
      }
    } else {
      _log.warning(
        '⚠️ authPayload is null — no Authorization header. URL: ${options.uri}',
      );
    }

    final deviceId = await _getDeviceId();
    _log.fine('📱 x-device-id: $deviceId | URL: ${options.uri}');
    options.headers['x-device-id'] = deviceId;

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionError ||
        (err.type == DioExceptionType.unknown &&
            err.error is SocketException)) {
      _log.warning(
        '🔌 Connection refused on ${err.requestOptions.uri}: ${err.error}',
      );
      return handler.next(err);
    }

    // 402 — подписка истекла/триал закончился
    if (err.response?.statusCode == 402) {
      _log.warning('💳 Payment required: ${err.requestOptions.uri}');
      _authStateNotifier.subscriptionRequired();
      return handler.next(err);
    }

    if (err.response?.statusCode == 409 || err.response?.statusCode == 403) {
      final responseBody = err.response?.data;
      final code = responseBody is Map ? responseBody['code'] : null;
      _log.warning(
        '🚫 HTTP ${err.response?.statusCode} on ${err.requestOptions.uri} — code: $code, body: $responseBody — forcing logout',
      );
      _authStateNotifier.logout();
      return handler.next(err);
    }

    if (err.response?.statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;
      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          final opt = err.requestOptions;
          final payload = await _storage.read(
            key: ConstantsEnum.authPayload.value,
          );
          if (payload == null) {
            handler.next(err);
            return;
          }
          final Map<String, dynamic> data = jsonDecode(payload);
          final String? accessToken = data['accessToken'];
          if (accessToken == null) {
            handler.next(err);
            return;
          }

          opt.headers['Authorization'] = accessToken;
          opt.validateStatus = (status) => status != null && status < 500;
          final response = await _dio.fetch(opt);

          if (response.statusCode == 401) {
            _log.warning('New token still returns 401, logging out');
            _authStateNotifier.logout();
            return handler.next(err);
          }

          handler.resolve(response);

          _authStateNotifier.login();
          return;
        } else {
          _authStateNotifier.logout();
          return handler.next(err);
        }
      } catch (error) {
        _log.warning('AuthInterceptor error: $error');
        handler.next(err);
        _authStateNotifier.logout();
        return;
      } finally {
        _isRefreshing = false;
      }
    }
    return handler.next(err);
  }

  Future<bool> _refreshToken() async {
    final accessToken = await _storage.read(
      key: ConstantsEnum.authPayload.value,
    );
    final privateKey = await _storage.read(key: ConstantsEnum.privateKey.value);

    if (accessToken == null || privateKey == null) {
      return false;
    }

    final Map<String, dynamic> data = jsonDecode(accessToken);
    final String? refreshToken = data['refreshToken'];
    if (refreshToken == null) return false;

    final publicKey = await _storage.read(key: ConstantsEnum.publicKey.value);
    if (publicKey == null) return false;

    try {
      final tempDio = Dio();
      final response = await tempDio.post(
        '$_baseUrl/auth/refresh',
        data: {'refreshToken': refreshToken, 'publicKey': publicKey},
      );

      final decodedPrivateKey = decodePrivateKey(privateKey);
      if (response.statusCode == 200) {
        final accessTokenData = AuthRegisterApiModel.fromJson(
          response.data as Map<String, dynamic>,
        );

        final decryptedAuthPayload = decryptAuthPayload(
          accessTokenData.authPayload,
          decodedPrivateKey,
        );

        await _storage.write(
          key: ConstantsEnum.authPayload.value,
          value: decryptedAuthPayload,
        );
        return true;
      } else {
        return false;
      }
    } catch (error) {
      _log.warning('Error in refresh token func $error');
      return false;
    }
  }
}
