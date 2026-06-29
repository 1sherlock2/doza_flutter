import 'package:doza_flutter/ui/screens/product_details/models/card_item_request.dart';

abstract class CartRepository {
  Future<bool> addToCart(List<CardItemRequest> cartItems);
}
