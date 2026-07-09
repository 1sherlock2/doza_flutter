import 'package:doza_flutter/data/services/models/cart_item/cart_item_api_model.dart';
import 'package:doza_flutter/data/services/models/city_delivery/city_delivery_api_model.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/models/additional_order_info_ui_model.dart';
import 'package:doza_flutter/ui/screens/product_details/models/card_item_request.dart';

abstract class CartRepository {
  Future<bool> addToCart(List<CardItemRequest> cartItems);
  Future<List<CartItemApiModel>> getCartElements({Set<int>? selectedIds});
  Future<bool> removeCartItem({required int cartItemId});
  Future<bool> removeSelectedCart({required Set<int> cartItemIds});
  Future<List<CityDeliveryApiModel>> getCityDelivery();
  Future<void> createOrder(
      {required AdditionalOrderInfoUiModel additionalOrderInfo,
      required List<CartItemApiModel> selectedCartItems});
}
