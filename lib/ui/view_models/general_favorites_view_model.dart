import 'package:doza_flutter/data/repositories/favorites/favorites_repository.dart';
import 'package:flutter/material.dart';

class GeneralFavoritesViewModel extends ChangeNotifier {
  GeneralFavoritesViewModel({required FavoritesRepository favoritesRepository})
      : _favoritesRepository = favoritesRepository;

  final FavoritesRepository _favoritesRepository;

  Set<int> _favoritesProductIds = {};
  Set<int> get favoritesProductIds => _favoritesProductIds;

  void getFavorites() async {
    final favoritesResponse = await _favoritesRepository.getFavorites();
    final favoritesReponseSet = favoritesResponse.toSet();
    _favoritesProductIds = favoritesReponseSet;
    notifyListeners();
  }

  void handleTapFavorites(int productId) async {
    await _favoritesRepository.toggleFavorites(productId);
    if (_favoritesProductIds.contains(productId)) {
      _favoritesProductIds.remove(productId);
    } else {
      _favoritesProductIds.add(productId);
    }
    notifyListeners();
  }

  bool isFavorites(int productId) {
    return _favoritesProductIds.contains(productId);
  }
}
