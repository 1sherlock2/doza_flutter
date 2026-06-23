import 'package:doza_flutter/data/repositories/products/products_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/models/products/products_api_model.dart';
import 'package:doza_flutter/data/services/models/user_favorites/user_favorites_api_model.dart';
import 'package:logging/logging.dart';

class ProductsRepositoryRemote implements ProductsRepository {
  ProductsRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;

  final _log = Logger('ProductsRepository');

  void warningMessage(Exception? exception) {
    return _log.warning('Api error, loading local data: $exception');
  }

  @override
  Future<List<ProductsApiModel>> getProducts() async {
    try {
      final resultProducts = await _apiClient.getProductsApi();
      if (resultProducts.isError()) {
        warningMessage(resultProducts.exceptionOrNull());
        return [];
      }
      final products = resultProducts.getOrThrow();
      return products
          .map((p) => p.copyWith(
                volumeMl:
                    p.volumeMl.where((v) => v != null).cast<int>().toList(),
              ))
          .toList();
    } catch (e) {
      _log.warning('Error $e');
      return [];
    }
  }

  @override
  Future<List<int>> getFavorites() async {
    try {
      final resultUserFavorites = await _apiClient.getFavoritesApi();
      if (resultUserFavorites.isError()) {
        warningMessage(resultUserFavorites.exceptionOrNull());
        return [];
      }
      final favoritesIds = resultUserFavorites.getOrThrow();
      return favoritesIds;
    } catch (e) {
      _log.warning('Error $e');
      return [];
    }
  }

  @override
  Future<List<UserFavoritesApiModel>> toggleFavorites(int productId) async {
    try {
      final resultUserFavorites =
          await _apiClient.toggleFavoritesApi(productId);
      if (resultUserFavorites.isError()) {
        warningMessage(resultUserFavorites.exceptionOrNull());
        return [];
      }
      final favorites = resultUserFavorites.getOrThrow();
      return favorites;
    } catch (e) {
      _log.warning('Error $e');
      return [];
    }
  }
}
