import 'package:doza_flutter/data/repositories/product_details/product_details_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/models/product_details/product_details_api_model.dart';
import 'package:logging/logging.dart';

class ProductDetailsRepositoryRemote implements ProductDetailsRepository {
  ProductDetailsRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;
  final _log = Logger('ProductDetailsRepositoryRemote');

  void warningMessage(Exception? exception) {
    return _log.warning('Api error, loading local data: $exception');
  }

  @override
  Future<ProductDetailsApiModel?> getProduct(String productId) async {
    try {
      final resultProduct = await _apiClient.getProductDetails(productId);
      if (resultProduct.isError()) {
        warningMessage(resultProduct.exceptionOrNull());
        return null;
      }
      final product = resultProduct.getOrNull();
      return product;
    } catch (e) {
      _log.warning('Error $e');
      return null;
    }
  }
}
