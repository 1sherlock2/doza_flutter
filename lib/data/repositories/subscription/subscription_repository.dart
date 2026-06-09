import 'package:doza_flutter/data/services/models/subscription/subscription_status_model.dart';
import 'package:result_dart/result_dart.dart';

abstract class SubscriptionRepository {
  // /// Получить список активных планов
  // AsyncResult<List<SubscriptionPlanModel>> getPlans();

  // /// Создать подписку и получить ссылку на оплату
  // AsyncResult<String> createSubscription(int planId, String paymentMethod);

  /// Получить текущий статус подписки
  AsyncResult<SubscriptionStatusModel> getStatus();
}
