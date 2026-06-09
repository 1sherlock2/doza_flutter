import 'package:doza_flutter/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AuthState { phoneError, logged, notLogged }

class AuthStateNotifier extends ChangeNotifier {
  bool _isLogged = false;
  bool get isLogged => _isLogged;

  bool _isPhoneNumberError = false;
  bool get isPhoneNumberError => _isPhoneNumberError;

  /// true — после получения 402, перенаправляет на /subscription
  bool _isSubscriptionRequired = false;
  bool get isSubscriptionRequired => _isSubscriptionRequired;

  /// true — показать кнопку «назад» на экране подписки (пользователь пришёл из регистрации)
  bool _showSubscriptionBackButton = false;
  bool get showSubscriptionBackButton => _showSubscriptionBackButton;

  /// true — после активации подписки перенаправить на домашнюю страницу
  bool _pendingHomeRedirect = false;

  /// Потребляет флаг перенаправления на home. Возвращает true один раз.
  /// Не вызывает notifyListeners — безопасно вызывать из redirect-функции роутера.
  bool consumeHomeRedirect() {
    if (_pendingHomeRedirect) {
      _pendingHomeRedirect = false;
      return true;
    }
    return false;
  }

  /// true — новый пользователь, показать экран выбора подписки/пробного периода
  bool _isNewUserRegistration = false;
  bool get isNewUserRegistration => _isNewUserRegistration;

  final FlutterSecureStorage _storage = .new();

  Future<void> initialize() async {
    final payload = await _storage.read(key: ConstantsEnum.authPayload.value);
    final privateKey = await _storage.read(key: ConstantsEnum.privateKey.value);
    if (payload != null && privateKey != null) {
      _isLogged = true;
    }
  }

  void phoneNumberError() {
    _isPhoneNumberError = true;
    notifyListeners();
  }

  void noPhoneNumberError() {
    _isPhoneNumberError = false;
  }

  void login() {
    _isLogged = true;
    notifyListeners();
  }

  void loginAsNewUser() {
    _isLogged = true;
    _isNewUserRegistration = true;
    notifyListeners();
  }

  /// Вызывается когда новый пользователь выбрал премиум-подписку.
  /// Сбрасывает флаг регистрации (чтобы редирект не мешал) и
  /// выставляет флаг отображения кнопки «назад» на экране подписки.
  void enterSubscriptionFromRegistration() {
    _isNewUserRegistration = false;
    _showSubscriptionBackButton = true;
    notifyListeners();
  }

  void clearNewUserRegistration() {
    _isNewUserRegistration = false;
    notifyListeners();
  }

  void logout() {
    _isLogged = false;
    _isSubscriptionRequired = false;
    _isNewUserRegistration = false;
    _showSubscriptionBackButton = false;
    _pendingHomeRedirect = false;
    notifyListeners();
  }

  void reset() {
    _isLogged = false;
    _isSubscriptionRequired = false;
    _isNewUserRegistration = false;
    _showSubscriptionBackButton = false;
    _pendingHomeRedirect = false;
    _storage.deleteAll();
  }

  /// Вызывается при получении 402 — подписка требуется
  void subscriptionRequired() {
    _isSubscriptionRequired = true;
    notifyListeners();
  }

  /// Вызывается после успешной оплаты — подписка активирована
  void subscriptionActivated() {
    _isSubscriptionRequired = false;
    _isNewUserRegistration = false;
    _showSubscriptionBackButton = false;
    _pendingHomeRedirect = true;
    notifyListeners();
  }
}
