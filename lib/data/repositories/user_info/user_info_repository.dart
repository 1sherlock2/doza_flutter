import 'package:doza_flutter/data/services/models/user_balance/user_bonuses_api_model.dart';

abstract class UserInfoRepository {
  Future<UserBonusesApiModel> getUserBonuses();
}
