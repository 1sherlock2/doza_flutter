import 'package:doza_flutter/data/repositories/cart/cart_repository.dart';
import 'package:doza_flutter/data/repositories/profile/profile_repository.dart';
import 'package:doza_flutter/data/repositories/subscription/subscription_repository.dart';
import 'package:doza_flutter/data/repositories/user_info/user_info_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';

class ProfileRepositoryRemote implements ProfileRepository {
  ProfileRepositoryRemote(
      {required ApiClient apiClient,
      required UserInfoRepository userInfoRepository,
      required SubscriptionRepository subscriptionRepository,
      required CartRepository cartRepository})
      : _apiClient = apiClient,
        _cartRepository = cartRepository,
        _subscriptionRepository = subscriptionRepository,
        _userInfoRepository = userInfoRepository;

  final ApiClient _apiClient;
  final UserInfoRepository _userInfoRepository;
  final SubscriptionRepository _subscriptionRepository;
  final CartRepository _cartRepository;
}
