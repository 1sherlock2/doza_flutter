import 'package:doza_flutter/data/repositories/cart/cart_repository.dart';
import 'package:doza_flutter/data/repositories/subscription/subscription_repository.dart';
import 'package:doza_flutter/data/repositories/user_info/user_info_repository.dart';
import 'package:doza_flutter/data/services/models/subscription/subscription_status_model.dart';
import 'package:doza_flutter/data/services/models/user_info/user_info_api_model.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel(
      {required UserInfoRepository userInfoRepository,
      required SubscriptionRepository subscriptionRepository,
      required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        _subscriptionRepository = subscriptionRepository,
        _userInfoRepository = userInfoRepository;

  final UserInfoRepository _userInfoRepository;
  final SubscriptionRepository _subscriptionRepository;
  final CartRepository _cartRepository;

  UserInfoApiModel? _userInfo;
  UserInfoApiModel? get userInfo => _userInfo;

  SubscriptionStatusModel? _subscriptionStatus;
  SubscriptionStatusModel? get subscriptionStatus => _subscriptionStatus;

  String? _errorSubscription;
  String? get errorSubscription => _errorSubscription;

  Future<void> getUserInfo() async {
    final resultGetUserInfo = await _userInfoRepository.getUserInfo();
    if (resultGetUserInfo != null) {
      _userInfo = resultGetUserInfo;
    }
    notifyListeners();
  }

  Future<void> getSubscriptionStatus() async {
    final resultSubscriptionStatus = await _subscriptionRepository.getStatus();
    resultSubscriptionStatus.fold((status) => _subscriptionStatus = status,
        (error) => _errorSubscription = error.toString());
    notifyListeners();
  }
}
