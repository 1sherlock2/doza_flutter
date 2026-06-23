import 'package:doza_flutter/data/repositories/favorites/favorites_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:logging/logging.dart';

class FavoritesRepositoryRemote implements FavoritesRepository {
  FavoritesRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;

  final _log = Logger('FavoritesRepository');
}
