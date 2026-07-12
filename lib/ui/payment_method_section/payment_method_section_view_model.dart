import 'package:doza_flutter/data/repositories/payment_method/payment_method_repository.dart';
import 'package:doza_flutter/data/services/models/spb_bank_list/spb_bank_list_api_model.dart';
import 'package:flutter/material.dart';

class PaymentMethodSectionViewModel extends ChangeNotifier {
  PaymentMethodSectionViewModel(
      {required PaymentMethodRepository paymentMethodRepository})
      : _paymentMethodRepository = paymentMethodRepository {
    getSpbBanks();
  }

  final PaymentMethodRepository _paymentMethodRepository;

  List<SpbBankListItemApiModel> _spbBankList = [];
  List<SpbBankListItemApiModel> get spbBankList => _spbBankList;

  Future<void> getSpbBanks() async {
    final resultByGetBanks = await _paymentMethodRepository.getBanks();
    if (resultByGetBanks != null) {
      _spbBankList = resultByGetBanks.items;
    }
    notifyListeners();
  }
}
