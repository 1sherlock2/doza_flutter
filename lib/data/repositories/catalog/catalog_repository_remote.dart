import 'package:doza_flutter/data/repositories/catalog/catalog_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:logging/logging.dart';

class CatalogRepositoryRemote implements CatalogRepository {
  CatalogRepositoryRemote({required ApiClient apiClient});

  final _log = Logger('CatalogRepository');
}
