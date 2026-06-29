import 'package:doza_flutter/data/repositories/favorites/favorites_repository.dart';
import 'package:doza_flutter/data/services/models/favorites_products/favorites_products_api_model.dart';
import 'package:doza_flutter/ui/view_models/catalog_view_model.dart';
import 'package:doza_flutter/ui/view_models/general_favorites_view_model.dart';
import 'package:flutter/material.dart';

class FavoritesViewModel extends ChangeNotifier {
  FavoritesViewModel(
      {required FavoritesRepository favoritesRepository,
      required CatalogViewModel catalogViewModel,
      required GeneralFavoritesViewModel generalFavoritesViewModel})
      : _favoritesRepository = favoritesRepository,
        _catalogViewModel = catalogViewModel,
        _generalFavoritesViewModel = generalFavoritesViewModel {
    _syncFromCatalog();
    _catalogViewModel.addListener(_syncFromCatalog);
    _generalFavoritesViewModel.addListener(_syncFromCatalog);
    searchInputController.addListener(handleSearch);
  }
  final GeneralFavoritesViewModel _generalFavoritesViewModel;
  final CatalogViewModel _catalogViewModel;
  final FavoritesRepository _favoritesRepository;

  final TextEditingController searchInputController = TextEditingController();

  List<FavoritesProductsApiModel> _favoritesProducts = [];
  List<FavoritesProductsApiModel> get favoritesProducts => _favoritesProducts;

  List<FavoritesProductsApiModel> _filteredFavoritesProducts = [];
  List<FavoritesProductsApiModel> get filteredFavoritesProducts =>
      _filteredFavoritesProducts;

  void _syncFromCatalog() {
    final allProducts = _catalogViewModel.products;
    final favoriteIds = _generalFavoritesViewModel.favoritesProductIds;

    _favoritesProducts = allProducts
        .where((p) => favoriteIds.contains(p.id))
        .map((p) => FavoritesProductsApiModel(
              id: p.id,
              name: p.name,
              imageUrl: p.imageUrl,
              basePrice: p.basePrice,
            ))
        .toList();

    _filteredFavoritesProducts = _favoritesProducts;
    notifyListeners();
  }

  void handleSearch() {
    if (searchInputController.text.isEmpty) {
      _filteredFavoritesProducts = _favoritesProducts;
    }
    notifyListeners();

    _filteredFavoritesProducts = _favoritesProducts
        .where((product) => product.name
            .toLowerCase()
            .contains(searchInputController.text.toLowerCase()))
        .toList();
    notifyListeners();
  }

  @override
  void dispose() {
    _generalFavoritesViewModel.removeListener(_syncFromCatalog);
    _catalogViewModel.removeListener(_syncFromCatalog);
    searchInputController.dispose();
    super.dispose();
  }
}
