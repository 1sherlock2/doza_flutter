import 'package:doza_flutter/data/repositories/user_info/user_info_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/models/user_balance/user_bonuses_api_model.dart';
import 'package:logging/logging.dart';

class UserInfoRepositoryRemote implements UserInfoRepository {
  UserInfoRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;
  final _log = Logger('UserInfoRepositoryRemote');

  void warningMessage(Exception? exception) {
    return _log.warning('Api error, loading local data: $exception');
  }

  @override
  Future<UserBonusesApiModel> getUserBonuses() async {
    try {
      final response = await _apiClient.getUserBonusesApi();
      if (response.isError()) {
        warningMessage(response.exceptionOrNull());
        return UserBonusesApiModel(balance: 0, bonusPercent: 0);
      }
      return response.getOrThrow();
    } catch (e) {
      _log.warning('Error $e');
      return UserBonusesApiModel(balance: 0, bonusPercent: 0);
    }
  }
}
