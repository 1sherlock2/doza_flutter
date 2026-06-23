import 'package:doza_flutter/data/repositories/categories/categories_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/models/categories/categories_api_model.dart';
import 'package:logging/logging.dart';

class CategoriesRepositoriesRemote implements CategoriesRepository {
  CategoriesRepositoriesRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final _log = Logger('CategoriesRepositoriesRemote');
  final ApiClient _apiClient;

  @override
  Future<List<CategoriesApiModel>> getCategories() async {
    try {
      final resultRecievedCategories = await _apiClient.getCategoriesApi();
      if (resultRecievedCategories.isError()) {
        _log.warning(
            'API error, not recieved categories: ${resultRecievedCategories.exceptionOrNull()}');
        return [];
      }
      final categories = resultRecievedCategories.getOrThrow();
      return categories;
    } catch (e) {
      _log.warning('Error $e');
      return [];
    }
  }
}
