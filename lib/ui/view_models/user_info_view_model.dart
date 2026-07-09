import 'package:doza_flutter/data/repositories/user_info/user_info_repository.dart';
import 'package:doza_flutter/data/services/models/user_balance/user_bonuses_api_model.dart';
import 'package:doza_flutter/data/services/subscription_state_notifier.dart';
import 'package:flutter/material.dart';

class UserInfoViewModel extends ChangeNotifier {
  UserInfoViewModel({
    required UserInfoRepository userInfoRepository,
    required SubscriptionStateNotifier subscriptionStateNotifier,
  })  : _userInfoRepository = userInfoRepository,
        _subscriptionStateNotifier = subscriptionStateNotifier {
    _hasSubscription = _subscriptionStateNotifier.hasAccess;
    _subscriptionStateNotifier.addListener(_onSubscriptionChanged);
  }

  final UserInfoRepository _userInfoRepository;
  final SubscriptionStateNotifier _subscriptionStateNotifier;

  bool _hasSubscription = false;
  bool get hasSubscription => _hasSubscription;

  UserBonusesApiModel _userBonuses =
      UserBonusesApiModel(balance: 0, bonusPercent: 0);
  UserBonusesApiModel get userBonuses => _userBonuses;

  void _onSubscriptionChanged() {
    _hasSubscription = _subscriptionStateNotifier.hasAccess;
    notifyListeners();
  }

  Future<void> getUserBonuses() async {
    final responseUserBonuses = await _userInfoRepository.getUserBonuses();
    _userBonuses = responseUserBonuses;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscriptionStateNotifier.removeListener(_onSubscriptionChanged);
    super.dispose();
  }
}
