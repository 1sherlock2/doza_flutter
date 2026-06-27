import 'package:doza_flutter/data/services/models/product_details/product_details_api_model.dart';

abstract class ProductDetailsRepository {
  Future<ProductDetailsApiModel?> getProduct(String productId);
}
