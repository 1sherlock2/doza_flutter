import 'package:doza_flutter/data/repositories/favorites/favorites_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/models/favorites_products/favorites_products_api_model.dart';
import 'package:doza_flutter/data/services/models/user_favorites/user_favorites_api_model.dart';
import 'package:logging/logging.dart';

class FavoritesRepositoryRemote implements FavoritesRepository {
  FavoritesRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;

  final _log = Logger('FavoritesRepository');

  void warningMessage(Exception? exception) {
    return _log.warning('Api error, loading local data: $exception');
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
  Future<List<FavoritesProductsApiModel>> getFavoritesProducts() async {
    try {
      final result = await _apiClient.getFavoritesProductsApi();
      if (result.isError()) {
        warningMessage(result.exceptionOrNull());
        return [];
      }
      final favoritesProducts = result.getOrThrow();
      return favoritesProducts;
    } catch (e) {
      _log.warning('Error $e');
      return [];
    }
  }
}
