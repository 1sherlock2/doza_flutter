import 'package:doza_flutter/data/services/models/product_details/product_details_api_model.dart';
import 'package:flutter/foundation.dart'; // ← добавить

class VolumeCardItemUiModel extends ChangeNotifier {
  VolumeCardItemUiModel(
      {required this.volumeInfo, this.count = 0, double? totalPrice})
      : totalPrice = totalPrice ?? 0.0;

  int count;
  double totalPrice;
  final VolumeInfoApiModel volumeInfo;

  void increment() {
    count++;
    totalPrice = count.toDouble() * volumeInfo.price;
    notifyListeners();
  }

  void decrement() {
    if (count > 0) {
      count--;
      totalPrice = count.toDouble() * volumeInfo.price;
      notifyListeners();
    }
  }
}
