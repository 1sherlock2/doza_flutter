import 'package:doza_flutter/data/repositories/subscription/subscription_repository.dart';
import 'package:flutter/foundation.dart';

/// Хранит закешированный статус подписки для синхронного чтения в redirect-функции роутера.
/// Обновляется асинхронно при старте приложения и при изменениях.
class SubscriptionStateNotifier extends ChangeNotifier {
  final SubscriptionRepository _repository;

  bool _hasActiveSubscription = false;
  bool _isTrialActive = false;

  bool get hasActiveSubscription => _hasActiveSubscription;
  bool get isTrialActive => _isTrialActive;

  /// true — если есть доступ (активная подписка или триал)
  bool get hasAccess => _hasActiveSubscription || _isTrialActive;

  SubscriptionStateNotifier(this._repository);

  /// Загружает статус подписки с сервера и кеширует его.
  /// Вызывается один раз при инициализации или после оплаты.
  Future<void> refresh() async {
    final result = await _repository.getStatus();
    result.fold(
      (status) {
        _hasActiveSubscription = status.hasActiveSubscription;
        _isTrialActive = status.isTrialActive;
        notifyListeners();
      },
      (_) {
        // При ошибке сети — не блокируем пользователя
        // Если были старые данные, оставляем их
      },
    );
  }

  /// Сбросить кеш (например, после логаута)
  void reset() {
    _hasActiveSubscription = false;
    _isTrialActive = false;
    notifyListeners();
  }
}
