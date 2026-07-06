import 'package:doza_flutter/data/repositories/cart/cart_repository.dart';
import 'package:doza_flutter/data/services/models/cart_item/cart_item_api_model.dart';
import 'package:doza_flutter/ui/view_models/cart_state_notifier.dart';
import 'package:flutter/material.dart';

class AdditionalPaymentInfoViewModel extends ChangeNotifier {
  AdditionalPaymentInfoViewModel(
      {required CartRepository cartRepository,
      required CartStateNotifier cartStateNotifier})
      : _cartRepository = cartRepository,
        _cartStateNotifier = cartStateNotifier {
    getSelectedCartItems();
  }

  final CartRepository _cartRepository;
  final CartStateNotifier _cartStateNotifier;

  List<CartItemApiModel> _selectedCartItems = [];
  List<CartItemApiModel> get selectedCartItems => _selectedCartItems;

  int productsPrice = 0;

  Future<void>? getSelectedCartItems() async {
    if (_cartStateNotifier.selectedCartByPayment.isEmpty) return;
    final response = await _cartRepository.getCartElements(
        selectedIds: _cartStateNotifier.selectedCartByPayment);
    _selectedCartItems = response;
    final totalPrice = _selectedCartItems.fold(
        0, (summ, item) => summ + (item.price * item.quantity));
    productsPrice = totalPrice;
    notifyListeners();
  }
}
