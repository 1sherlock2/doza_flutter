import 'package:doza_flutter/data/services/models/categories/categories_api_model.dart';

abstract class CategoriesRepository {
  Future<List<CategoriesApiModel>> getCategories();
}
