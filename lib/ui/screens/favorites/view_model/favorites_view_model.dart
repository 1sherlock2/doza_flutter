import 'package:doza_flutter/data/repositories/favorites/favorites_repository.dart';
import 'package:doza_flutter/data/services/models/favorites_products/favorites_products_api_model.dart';
import 'package:flutter/material.dart';

class FavoritesViewModel extends ChangeNotifier {
  FavoritesViewModel({required FavoritesRepository favoritesRepository})
      : _favoritesRepository = favoritesRepository {
    getFavoritesProducts();
  }

  final FavoritesRepository _favoritesRepository;

  final TextEditingController searchInputController = TextEditingController();

  List<FavoritesProductsApiModel> _favoritesProducts = [];
  List<FavoritesProductsApiModel> get favoritesProducts => _favoritesProducts;

  List<FavoritesProductsApiModel> _filteredFavoritesProducts = [];
  List<FavoritesProductsApiModel> get filteredFavoritesProducts =>
      _filteredFavoritesProducts;

  void getFavoritesProducts() async {
    final favoriteProductsResponse =
        await _favoritesRepository.getFavoritesProducts();
    _favoritesProducts = favoriteProductsResponse;
    _filteredFavoritesProducts = favoriteProductsResponse;
    notifyListeners();
  }

  void handleSearch() {
    if (searchInputController.text.isEmpty) {
      _filteredFavoritesProducts = _favoritesProducts;
    }
    notifyListeners();

    _filteredFavoritesProducts = _filteredFavoritesProducts
        .where((product) => product.name
            .toLowerCase()
            .contains(searchInputController.text.toLowerCase()))
        .toList();
    notifyListeners();
  }

  @override
  void dispose() {
    searchInputController.dispose();
    super.dispose();
  }
}
