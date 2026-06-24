import 'package:doza_flutter/data/services/models/favorites_products/favorites_products_api_model.dart';
import 'package:doza_flutter/data/services/models/user_favorites/user_favorites_api_model.dart';

abstract class FavoritesRepository {
  Future<List<FavoritesProductsApiModel>> getFavoritesProducts();
  Future<List<int>> getFavorites();
  Future<List<UserFavoritesApiModel>> toggleFavorites(int productId);
}
