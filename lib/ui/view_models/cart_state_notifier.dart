import 'package:doza_flutter/data/repositories/cart/cart_repository.dart';
import 'package:doza_flutter/data/services/models/cart_item/cart_item_api_model.dart';
import 'package:doza_flutter/ui/screens/product_details/models/card_item_request.dart';
import 'package:flutter/material.dart';

class CartStateNotifier extends ChangeNotifier {
  CartStateNotifier({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  final CartRepository _cartRepository;

  List<CartItemApiModel> _cartItems = [];
  List<CartItemApiModel> get cartItems => _cartItems;

  final Set<int> _selectedCartByPayment = {};
  Set<int> get selectedCartByPayment => _selectedCartByPayment;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCart() async {
    _cartItems = await _cartRepository.getCartElements();
  }

  void removeCartItem(int cartItemId) {
    _cartItems.removeWhere((cartItem) => cartItem.cartItemId == cartItemId);
  }

  void removeSelectedItem(Set<int> selectedIds) {
    if (selectedIds.isEmpty) return;
    _cartItems
        .removeWhere((cartItem) => selectedIds.contains(cartItem.cartItemId));
  }

  void handleSelectedCartByPayment(Set<int> selectedItems) {
    _selectedCartByPayment.clear();
    _selectedCartByPayment.addAll(selectedItems);
    notifyListeners();
  }

  Future<bool> addToCart(List<CardItemRequest> items) async {
    final success = await _cartRepository.addToCart(items);
    if (!success) {
      _errorMessage = 'Ошибка загрузки корзины';
      return false;
    }
    await fetchCart();
    notifyListeners();
    return success;
  }
}
