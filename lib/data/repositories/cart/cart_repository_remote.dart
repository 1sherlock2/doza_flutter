import 'package:doza_flutter/data/repositories/cart/cart_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/models/cart_item/cart_item_api_model.dart';
import 'package:doza_flutter/data/services/models/city_delivery/city_delivery_api_model.dart';
import 'package:doza_flutter/ui/screens/product_details/models/card_item_request.dart';
import 'package:logging/logging.dart';

class CartRepositoryRemote implements CartRepository {
  CartRepositoryRemote({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  final _log = Logger('CartRepositoryRemote');

  void warningMessage(Exception? exception) {
    return _log.warning('Api error, loading local data: $exception');
  }

  @override
  Future<bool> addToCart(List<CardItemRequest> cartItems) async {
    try {
      final resultAddToCart = await _apiClient.addToCart(cartItems);
      if (resultAddToCart.isError()) {
        warningMessage(resultAddToCart.exceptionOrNull());
        return false;
      }
      return resultAddToCart.getOrThrow();
    } catch (e) {
      _log.warning('Error $e');
      return false;
    }
  }

  @override
  Future<List<CartItemApiModel>> getCartElements(
      {Set<int>? selectedIds}) async {
    try {
      final resultAddToCart = await _apiClient.getCartItems(selectedIds);
      if (resultAddToCart.isError()) {
        warningMessage(resultAddToCart.exceptionOrNull());
        return [];
      }
      return resultAddToCart.getOrThrow();
    } catch (e) {
      _log.warning('Error $e');
      return [];
    }
  }

  @override
  Future<bool> removeCartItem({required int cartItemId}) async {
    try {
      final resultRemoveCartItem =
          await _apiClient.removeCartItem(cartItemId: cartItemId);
      if (resultRemoveCartItem.isError()) {
        warningMessage(resultRemoveCartItem.exceptionOrNull());
        return false;
      }
      return resultRemoveCartItem.getOrThrow();
    } catch (e) {
      _log.warning('Error $e');
      return false;
    }
  }

  @override
  Future<bool> removeSelectedCart({required Set<int> cartItemIds}) async {
    try {
      final resultRemoveSelectedCart =
          await _apiClient.removeSelectedCart(cartItemIds: cartItemIds);
      if (resultRemoveSelectedCart.isError()) {
        warningMessage(resultRemoveSelectedCart.exceptionOrNull());
        return false;
      }
      return resultRemoveSelectedCart.getOrThrow();
    } catch (e) {
      _log.warning('Error $e');
      return false;
    }
  }

  @override
  Future<List<CityDeliveryApiModel>> getCityDelivery() async {
    try {
      final resultCityDelivery = await _apiClient.getCityDelivery();
      if (resultCityDelivery.isError()) {
        warningMessage(resultCityDelivery.exceptionOrNull());
        return [];
      }
      return resultCityDelivery.getOrThrow();
    } catch (e) {
      _log.warning('Error $e');
      return [];
    }
  }
}
