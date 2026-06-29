import 'package:doza_flutter/data/repositories/cart/cart_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
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
}
