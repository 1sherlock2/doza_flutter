import 'package:dio/dio.dart';
import 'package:doza_flutter/data/services/models/auth/auth_api_model/auth_api_model.dart';
import 'package:doza_flutter/data/services/models/auth/auth_check_phone/auth_check_phone.dart';
import 'package:doza_flutter/data/services/models/auth/auth_register_api_model/auth_register_api_model.dart';
import 'package:doza_flutter/data/services/models/auth/call_status_api_model/call_status_api_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:result_dart/result_dart.dart';

class AuthApiClient {
  final Logger _log = Logger('AuthApiClient');
  final Dio _dio = Dio();
  final Dio _externalDio = Dio(); // zvonok.com — без интерсептора

  final String _host = dotenv.env['SERVER_IP'] ?? '10.0.2.2';
  final int _port = dotenv.env['SERVER_PORT'] != null
      ? (int.tryParse(dotenv.env['SERVER_PORT']!) ?? 6000)
      : 6000;

  String get _baseUrl => 'http://$_host:$_port';

  Failure<T, Exception> formatExceptionFailure<T extends Object>(
    Object error,
  ) =>
      Failure<T, Exception>(FormatException('Failed to parse $error'));

  AsyncResult<bool> checkUserStatus({required String deviceId}) async {
    try {
      final response = await _dio.get('$_baseUrl/auth/status/$deviceId');
      if (response.statusCode != 200) {
        Failure(Exception(false));
      }
      return Success(true);
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      return Failure(Exception(error));
    }
  }

  AsyncResult<AuthCheckPhone> checkPhone({required String number}) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/auth/check_phone',
        data: {'number': number},
      );
      try {
        return Success(
          AuthCheckPhone.fromJson(response.data as Map<String, dynamic>),
        );
      } catch (error) {
        return formatExceptionFailure<AuthCheckPhone>(error);
      }
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      return Failure(Exception(error));
    }
  }

  // TODO: переименовать AuthRegisterApiModel -> AuthApiModel
  AsyncResult<AuthRegisterApiModel> login({
    required String phone,
    required String publicKey,
    required String deviceId,
  }) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/auth/login',
        data: {'phone': phone, 'publicKey': publicKey, 'deviceId': deviceId},
      );
      try {
        return Success(
          AuthRegisterApiModel.fromJson(response.data as Map<String, dynamic>),
        );
      } catch (error) {
        return formatExceptionFailure<AuthRegisterApiModel>(error);
      }
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      return Failure(Exception(error));
    }
  }

  AsyncResult<String> getAuthPhone() async {
    try {
      final response = await _dio.get('$_baseUrl/auth/get_auth_phone');
      return Success(response.data as String);
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      return Failure(Exception(error));
    }
  }

  AsyncResult<AuthApiModel> getVerifyNumber({
    required String number,
    required String authPhone,
  }) async {
    try {
      final response = await _externalDio.get(
        'https://zvonok.com/manager/cabapi_external/api/v1/phones/confirm/',
        queryParameters: {
          'public_key': dotenv.env['ZVONOK_API_KEY'],
          'phone': number,
          'campaign_id': dotenv.env['ZVONOK_CAMPAIGN_ID'],
        },
      );
      try {
        final phoneNumberStatus = AuthApiModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        if (phoneNumberStatus.status == 'ok') {
          return Success(phoneNumberStatus);
        }
        return Failure(Exception('Phone number verification failed'));
      } catch (error) {
        return formatExceptionFailure<AuthApiModel>(error);
      }
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      return Failure(Exception(error));
    }
  }

  AsyncResult<CallStatusApiModel> getVerifyCall({
    required AuthApiModel phoneStatus,
  }) async {
    try {
      final response = await _externalDio.get(
        'https://zvonok.com/manager/cabapi_external/api/v1/phones/calls_by_phone/',
        queryParameters: {
          'public_key': dotenv.env['ZVONOK_API_KEY'],
          'phone': phoneStatus.data.phone,
          'campaign_id': dotenv.env['ZVONOK_CAMPAIGN_ID'],
        },
      );
      try {
        final list = response.data as List<dynamic>;
        return Success(
          CallStatusApiModel.fromJson(list.first as Map<String, dynamic>),
        );
      } catch (error) {
        _log.warning('$error');
        return formatExceptionFailure<CallStatusApiModel>(error);
      }
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      return Failure(Exception(error));
    }
  }
}
