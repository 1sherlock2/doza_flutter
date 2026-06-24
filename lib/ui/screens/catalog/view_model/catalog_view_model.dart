import 'dart:math';

import 'package:collection/collection.dart';
import 'package:doza_flutter/data/repositories/categories/categories_repository.dart';
import 'package:doza_flutter/data/repositories/products/products_repository.dart';
import 'package:doza_flutter/data/services/models/categories/categories_api_model.dart';
import 'package:doza_flutter/data/services/models/products/products_api_model.dart';
import 'package:doza_flutter/utils/unique_number.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class CatalogViewModel extends ChangeNotifier {
  CatalogViewModel(
      {required CategoriesRepository categoriesRepository,
      required ProductsRepository productsRepository})
      : _categoriesRepository = categoriesRepository,
        _productsRepository = productsRepository {
    _getCategories();
    _getProducts();
    searchInputController.addListener(handleSearch);
  }

  final TextEditingController searchInputController = TextEditingController();

  final _log = Logger('CatalogViewModel');
  final ProductsRepository _productsRepository;
  final CategoriesRepository _categoriesRepository;

  List<CategoriesApiModel> _categories = [];
  List<CategoriesApiModel> get categories => _categories;

  late final int _uniqueCategoryId;

  final List<int> _selectedCategories = [];
  List<int> get selectedCategories => _selectedCategories;

  List<ProductsApiModel> _products = [];
  List<ProductsApiModel> get products => _products;

  List<ProductsApiModel> _filteredProducts = [];
  List<ProductsApiModel> get filteredProducts => _filteredProducts;

  void handleSearch() {
    _selectedCategories.clear();
    _selectedCategories.add(_uniqueCategoryId);

    if (searchInputController.text.isEmpty) {
      _filteredProducts = _products;
    }
    notifyListeners();

    _filteredProducts = _filteredProducts
        .where((product) => product.name
            .toLowerCase()
            .contains(searchInputController.text.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void _getProducts() async {
    final productsResponse = await _productsRepository.getProducts();
    _products = productsResponse;
    _filteredProducts = productsResponse;
    notifyListeners();
  }

  String getCategoryNameById(int categoryId) {
    final CategoriesApiModel? findCategory =
        _categories.firstWhereOrNull((category) => category.id == categoryId);
    if (findCategory == null) {
      return '';
    }
    return findCategory.name;
  }

  void _filterProduct() {
    if (_selectedCategories.contains(_uniqueCategoryId)) {
      _filteredProducts = _products;
      return;
    }
    _filteredProducts = _products
        .where((product) => _selectedCategories.contains(product.categoryId))
        .toList();
  }

  void toggleCategory(int categoryId) {
    if (categoryId == _uniqueCategoryId) {
      _selectedCategories
          .removeWhere((category) => category != _uniqueCategoryId);
      _selectedCategories.add(_uniqueCategoryId);
    } else {
      if (_selectedCategories.contains(categoryId)) {
        _selectedCategories.remove(categoryId);
      } else {
        _selectedCategories.add(categoryId);
      }
      if (_selectedCategories.contains(_uniqueCategoryId)) {
        _selectedCategories.remove(_uniqueCategoryId);
      }
      if (_selectedCategories.isEmpty) {
        _selectedCategories.add(_uniqueCategoryId);
      }
    }

    _filterProduct();
    notifyListeners();
  }

  bool isSelected(int categoryId) {
    return _selectedCategories.contains(categoryId);
  }

  Future<List<CategoriesApiModel>> _getCategories() async {
    final categoriesResponse = await _categoriesRepository.getCategories();
    categoriesResponse.sort(((a, b) => a.name.compareTo(b.name)));
    final categoriesResponseIds =
        categoriesResponse.map((category) => category.id).toList();
    final uniqueNumber = generateUniqueNumberRecursive(
        number: Random().nextInt(100000),
        existingNumbers: categoriesResponseIds);
    _uniqueCategoryId = uniqueNumber;
    _selectedCategories.add(_uniqueCategoryId);
    _categories = [
      CategoriesApiModel(id: uniqueNumber, name: 'Все', slug: 'all'),
      ...categoriesResponse
    ];
    _log.info({categories: _categories});
    notifyListeners();
    return categoriesResponse;
  }

  @override
  void dispose() {
    searchInputController.dispose();
    super.dispose();
  }
}
