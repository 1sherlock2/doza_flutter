import 'package:doza_flutter/data/repositories/subscription/subscription_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/models/subscription/subscription_status_model.dart';
import 'package:result_dart/result_dart.dart';

class SubscriptionRepositoryRemote implements SubscriptionRepository {
  const SubscriptionRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  // @override
  // AsyncResult<List<SubscriptionPlanModel>> getPlans() =>
  //     _apiClient.getSubscriptionPlans();

  // @override
  // AsyncResult<String> createSubscription(int planId, String paymentMethod) =>
  //     _apiClient.createSubscription(planId, paymentMethod);

  @override
  AsyncResult<SubscriptionStatusModel> getStatus() =>
      _apiClient.getSubscriptionStatus();
}
