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

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchCart() async {
    _cartItems = await _cartRepository.getCartElements();
  }

  void removeCartItem(int cartItemId) {
    _cartItems.removeWhere((cartItem) => cartItem.cartItemId == cartItemId);
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
