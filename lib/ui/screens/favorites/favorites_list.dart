import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/favorites/view_model/favorites_view_model.dart';
import 'package:doza_flutter/ui/screens/favorites/widgets/favorites_card.dart';
import 'package:flutter/material.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList(
      {super.key, required FavoritesViewModel favoritesViewModel})
      : _favoritesViewModel = favoritesViewModel;

  final FavoritesViewModel _favoritesViewModel;

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget._favoritesViewModel,
      builder: (context, _) {
        if (widget._favoritesViewModel.favoritesProducts.isEmpty) {
          return const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'В избранном нет товаров',
              style: TextStyle(color: AppColors.black1),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 200,
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            children: widget._favoritesViewModel.filteredFavoritesProducts
                .map((favoritesProduct) => Card.filled(
                      elevation: 1,
                      shadowColor: AppColors.green5,
                      borderOnForeground: true,
                      child: FavoritesCard(favoritesProduct: favoritesProduct),
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
