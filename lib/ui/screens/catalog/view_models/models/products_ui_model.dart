import 'package:doza_flutter/data/services/models/products/products_api_model.dart';

abstract class ProductsUiModel {
  ProductsUiModel(ProductsApiModel product, bool isFavorite);
}
