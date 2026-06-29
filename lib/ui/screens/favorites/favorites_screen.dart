import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/favorites/view_models/favorites_view_model.dart';
import 'package:doza_flutter/ui/screens/favorites/widgets/favorites_list.dart';
import 'package:doza_flutter/ui/widgets/search_input.dart';
import 'package:doza_flutter/ui/widgets/sort_catalog.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen(
      {super.key, required FavoritesViewModel favoritesViewModel})
      : _favoritesViewModel = favoritesViewModel;

  final FavoritesViewModel _favoritesViewModel;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white2,
      child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
            child: Column(
              children: [
                Row(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListenableBuilder(
                        listenable: widget._favoritesViewModel,
                        builder: (context, child) => Expanded(
                                child: SearchInput(
                              controller: widget
                                  ._favoritesViewModel.searchInputController,
                              onSearch: widget._favoritesViewModel.handleSearch,
                              isEnabled: widget._favoritesViewModel
                                  .favoritesProducts.isNotEmpty,
                            ))),
                    SortCatalog()
                  ],
                ),
                Expanded(
                  child: FavoritesList(
                      favoritesViewModel: widget._favoritesViewModel),
                )
              ],
            ),
          )),
    );
  }
}
