import 'dart:async';

import 'package:doza_flutter/data/repositories/auth/auth_repository.dart';
import 'package:doza_flutter/data/services/auth_state_notifier.dart';
import 'package:doza_flutter/data/services/call_state_service.dart';
import 'package:doza_flutter/data/services/models/auth/auth_api_model/auth_api_model.dart';
import 'package:doza_flutter/data/services/models/auth/call_status_api_model/call_status_api_model.dart';
import 'package:doza_flutter/ui/screens/auth/view_models/utils.dart';
import 'package:doza_flutter/utils/constants.dart';
import 'package:doza_flutter/utils/generate_keys.dart';
import 'package:doza_flutter/utils/get_device_id.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel({
    required AuthRepository authRepository,
    required CallStateService callStateService,
    required AuthStateNotifier authStateNotifier,
  })  : _authRepository = authRepository,
        _callStateService = callStateService,
        _authStateNotifier = authStateNotifier,
        _log = Logger('AuthViewModel') {
    _initialGetAuthPhone();
  }

  final AuthStateNotifier _authStateNotifier;
  final AuthRepository _authRepository;
  final Logger _log;
  final CallStateService _callStateService;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  String? _authPhone;
  String? _userPhone;
  bool showPhone = false;
  bool _isCallProcessing = false;
  bool _isCallDetected = false;
  bool _isStatusFailed = false;
  bool _isCallDetecting = false;

  StreamSubscription<CallEventType>? _callSubscription;
  bool _disposed = false;

  String? get authPhone => _authPhone;
  String? get userPhone => _userPhone;
  bool get isCallProcessing => _isCallProcessing;
  bool get isStatusFailed => _isStatusFailed;
  bool get isCallDetected => _isCallDetected;
  bool get isCallDetecting => _isCallDetecting;

  /// Возвращает true, если введённый номер соответствует российскому формату.
  /// Принимает: +7XXXXXXXXXX, 8XXXXXXXXXX, 7XXXXXXXXXX (11 цифр).
  bool get isUserPhoneValid {
    if (_userPhone == null || _userPhone!.isEmpty) return false;
    final digits = _userPhone!.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.length != 11) return false;
    return digits.startsWith('7') || digits.startsWith('8');
  }

  void setUserPhone(String phone) {
    _userPhone = phone;
    notifyListeners();
  }

  Future<void> _initialGetAuthPhone() async {
    final resultAuthPhone = await _authRepository.getPhone();
    if (resultAuthPhone != null) {
      _authPhone = resultAuthPhone;
    }
    notifyListeners();
  }

  Future<({RSAPublicKey publicKey, RSAPrivateKey privateKey, bool isNew})>
      _initKeys() async {
    final existingKey = await _storage.read(
      key: ConstantsEnum.privateKey.value,
    );

    // При наличие приватного ключа генерирует публичный
    if (existingKey != null) {
      final privateKey = decodePrivateKey(existingKey);
      final publicKey = RSAPublicKey(
        privateKey.modulus!,
        privateKey.publicExponent!,
      );
      return (publicKey: publicKey, privateKey: privateKey, isNew: false);
    }
    // Иначе создаем новые
    final keys = await generateKeys();
    return (
      publicKey: keys.publicKey,
      privateKey: keys.privateKey,
      isNew: true,
    );
  }

  void _initializeCallTracking({required AuthApiModel statusPhone}) {
    _callSubscription?.cancel();
    _callSubscription = _callStateService.callStateStream.listen((event) async {
      switch (event) {
        case CallEventType.started:
          _isCallProcessing = true;
          _isCallDetecting = false;
          _isStatusFailed = false;
          _log.info('📞 Call processing started');
          notifyListeners();

        case CallEventType.completed:
          _isCallDetected = true;
          _log.info('✅ Call completed');
          notifyListeners();

          try {
            // Задержка, для того чтобы данные zvonok.com обновились
            await Future.delayed(Duration(seconds: 5));

            // Получение информации о статусе звонка
            final CallStatusApiModel? statusCallResponse =
                await _authRepository.verifyCall(phoneStatus: statusPhone);

            if (statusCallResponse == null ||
                statusCallResponse.dialStatusDisplay == null) {
              _isStatusFailed = true;
              _isCallProcessing = false;
              notifyListeners();
              _scheduleFormReset();
              return;
            }

            switch (statusCallResponse.status) {
              case CallStatus.expires:
              case CallStatus.pincodeNook:
                _isStatusFailed = true;
              case CallStatus.pincodeOk:
                _isStatusFailed = false;

                final keys = await _initKeys();
                final (:publicKey, :privateKey, :isNew) = keys;

                final encodedPublicKey = encodePublicKey(publicKey);
                final deviceId = await getDeviceId();

                final encryptedToken = await _authRepository.login(
                  phoneByAuth: statusCallResponse.phone,
                  publicKey: encodedPublicKey,
                  deviceId: deviceId,
                );
                final accessTokenData = decryptAuthPayload(
                  encryptedToken.authPayload,
                  privateKey,
                );
                await _storage.write(
                  key: ConstantsEnum.authPayload.value,
                  value: accessTokenData,
                );
                await _storage.write(
                  key: ConstantsEnum.userPhone.value,
                  value: statusCallResponse.phone,
                );
                // Используем флаг isNewUser от сервера для корректного определения
                // нового пользователя (не зависит от состояния локального хранилища)
                if (encryptedToken.isNewUser) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _authStateNotifier.loginAsNewUser();
                  });
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _authStateNotifier.login();
                  });
                }
              case CallStatus.inProcess:
                _log.info('📞 Call processing');
                _isCallDetecting = true;
            }
            _isCallProcessing = false;
            notifyListeners();

            if (_isStatusFailed || _isCallDetecting) {
              _scheduleFormReset();
            }
          } catch (error, stackTrace) {
            _log.shout(
              '❌ Error during call verification: $error',
              error,
              stackTrace,
            );
            _isCallProcessing = false;
            _isStatusFailed = true;
            notifyListeners();
            _scheduleFormReset();
          }

        case CallEventType.failed:
          _isCallProcessing = false;
          _isStatusFailed = true;
          _log.warning('❌ Call failed');
          notifyListeners();
      }
    });
  }

  void handleClickCall() async {
    try {
      if (_userPhone == null || _userPhone!.isEmpty) {
        _log.warning('User phone is not entered');
        _isStatusFailed = true;
        notifyListeners();
        return;
      }

      if (!isUserPhoneValid) {
        _log.warning('User phone is invalid: $_userPhone');
        _isStatusFailed = true;
        notifyListeners();
        return;
      }

      if (_authPhone == null) {
        _log.warning('Auth phone is not defined');
        _isStatusFailed = true;
        return;
      }

      _callStateService.reset();

      _isCallProcessing = true;
      _isStatusFailed = false;
      _isCallDetecting = false;
      notifyListeners();

      final statusPhone = await _authRepository.verifyNumber(
        number: _userPhone!,
        authPhone: _authPhone!,
      );

      if (statusPhone != null) {
        await _callStateService.initialize();
        _initializeCallTracking(statusPhone: statusPhone);

        bool? callResult = await FlutterPhoneDirectCaller.callNumber(
          _authPhone!,
        );

        if (callResult == null) {
          _log.warning('Result by call is not success');
          _isCallProcessing = false;
          notifyListeners();
          return;
        }

        notifyListeners();
      } else {
        _isStatusFailed = true;
        _isCallProcessing = false;
        notifyListeners();
      }
    } on PlatformException catch (error) {
      _log.shout('Error in handleClickCall: ${error.message}');
    }
  }

  /// Сбрасывает состояние формы через 3 секунды, чтобы пользователь мог
  /// повторно ввести номер без ошибок/лоадеров на экране.
  void _scheduleFormReset() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_disposed) return;
      _isStatusFailed = false;
      _isCallDetecting = false;
      _isCallDetected = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _disposed = true;
    _callSubscription?.cancel();
    _callStateService.dispose();
    super.dispose();
  }
}
