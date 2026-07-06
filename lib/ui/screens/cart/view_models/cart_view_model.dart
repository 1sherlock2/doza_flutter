import 'package:doza_flutter/data/repositories/cart/cart_repository.dart';
import 'package:doza_flutter/data/services/models/cart_item/cart_item_api_model.dart';
import 'package:doza_flutter/ui/view_models/cart_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class CartViewModel extends ChangeNotifier {
  CartViewModel(
      {required CartRepository cartRepository,
      required CartStateNotifier cartStateNorifier})
      : _cartRepository = cartRepository,
        _cartStateNorifier = cartStateNorifier {
    getCartItems();
    cartStateNorifier.addListener(_onCartChanged);
  }

  final _log = Logger('CartViewModel');
  final CartStateNotifier _cartStateNorifier;
  final CartRepository _cartRepository;

  List<CartItemApiModel> _cartItems = [];
  List<CartItemApiModel> get cartItems => _cartItems;

  final Set<int> _selectedCartItemIds = {};
  Set<int> get selectedCartItemIds => _selectedCartItemIds;

  int totalPrice() {
    final selectedProducts = _cartItems
        .where((item) => selectedCartItemIds.contains(item.cartItemId));
    final totalPrice = selectedProducts.fold(
        0, (prev, value) => prev + value.price * value.quantity);
    return totalPrice;
  }

  Function(bool?) handleSelectedChange(int value) {
    return (bool? selected) {
      if (_selectedCartItemIds.contains(value)) {
        _selectedCartItemIds.remove(value);
      } else {
        _selectedCartItemIds.add(value);
      }
      notifyListeners();
    };
  }

  void handleSelectedAll() {
    final cartItemIds = _cartItems.map((item) => item.cartItemId);
    _selectedCartItemIds.addAll(cartItemIds);
    notifyListeners();
  }

  void handleClearAll() {
    _selectedCartItemIds.clear();
    notifyListeners();
  }

  Future<void> handleDeleteSelected() async {
    final success = await _cartRepository.removeSelectedCart(
        cartItemIds: _selectedCartItemIds);
    if (!success) return;
    _cartStateNorifier.removeSelectedItem(_selectedCartItemIds);
    _selectedCartItemIds.clear();
    notifyListeners();
  }

  void _onCartChanged() {
    _log.warning(_cartItems);
    _cartItems = _cartStateNorifier.cartItems;
    notifyListeners();
  }

  void getCartItems() async {
    await _cartStateNorifier.fetchCart();
    _cartItems = _cartStateNorifier.cartItems;
    _log.info({cartItems});
    notifyListeners();
  }

  void deleteOneProduct({required int cartItemId}) async {
    final success =
        await _cartRepository.removeCartItem(cartItemId: cartItemId);
    if (!success) return;
    _cartStateNorifier.removeCartItem(cartItemId);
    notifyListeners();
  }

  @override
  void dispose() {
    _cartStateNorifier.removeListener(_onCartChanged);
    super.dispose();
  }
}
