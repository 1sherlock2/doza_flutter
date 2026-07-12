import 'package:doza_flutter/data/repositories/payment_method/payment_method_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/models/spb_bank_list/spb_bank_list_api_model.dart';
import 'package:logging/logging.dart';

class PaymentMethodRepositoryRemote implements PaymentMethodRepository {
  PaymentMethodRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;
  final _log = Logger('PaymentMethodRepositoryRemote');

  @override
  Future<SpbBankListApiModel?> getBanks() async {
    try {
      final result = await _apiClient.getBanksApi();
      if (result.isError()) {
        _log.warning(result.exceptionOrNull());
        return null;
      }
      return result.getOrNull();
    } catch (e) {
      _log.warning('Error $e');
      return null;
    }
  }
}
