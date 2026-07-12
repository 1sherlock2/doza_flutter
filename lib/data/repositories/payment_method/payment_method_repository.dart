import 'package:doza_flutter/data/services/models/spb_bank_list/spb_bank_list_api_model.dart';

abstract class PaymentMethodRepository {
  Future<SpbBankListApiModel?> getBanks();
}
