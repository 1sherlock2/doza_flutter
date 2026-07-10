import 'package:doza_flutter/data/repositories/subscription/subscription_repository.dart';
import 'package:flutter/foundation.dart';

/// Хранит закешированный статус подписки для синхронного чтения в redirect-функции роутера.
/// Обновляется асинхронно при старте приложения и при изменениях.
class SubscriptionStateNotifier extends ChangeNotifier {
  final SubscriptionRepository _repository;

  bool _hasActiveSubscription = false;
  bool get hasAccess => _hasActiveSubscription;

  int _discountPercent = 0;
  int get discountPercent => _discountPercent;

  bool get hasActiveSubscription => _hasActiveSubscription;

  /// true — если есть доступ (активная подписка)

  SubscriptionStateNotifier(this._repository) {
    refresh();
  }

  /// Загружает статус подписки с сервера и кеширует его.
  /// Вызывается один раз при инициализации или после оплаты.
  Future<void> refresh() async {
    final result = await _repository.getStatus();
    result.fold(
      (status) {
        _hasActiveSubscription = status.hasActiveSubscription;
        _discountPercent = status.discountPercent;
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
    notifyListeners();
  }
}
