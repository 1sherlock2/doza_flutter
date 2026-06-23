import 'package:doza_flutter/data/services/models/products/products_api_model.dart';
import 'package:doza_flutter/data/services/models/user_favorites/user_favorites_api_model.dart';

abstract class ProductsRepository {
  Future<List<ProductsApiModel>> getProducts();
  Future<List<UserFavoritesApiModel>> toggleFavorites(int productId);
  Future<List<int>> getFavorites();
}
