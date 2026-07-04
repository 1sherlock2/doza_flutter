import 'package:doza_flutter/data/services/models/cart_item/cart_item_api_model.dart';
import 'package:doza_flutter/ui/screens/product_details/models/card_item_request.dart';

abstract class CartRepository {
  Future<bool> addToCart(List<CardItemRequest> cartItems);
  Future<List<CartItemApiModel>> getCartElements();
  Future<bool> removeCartItem({required int cartItemId});
}
