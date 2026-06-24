import 'package:doza_flutter/data/services/models/favorites_products/favorites_products_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/view_models/general_favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesCard extends StatefulWidget {
  const FavoritesCard({
    super.key,
    required FavoritesProductsApiModel favoritesProduct,
  }) : _favoritesProduct = favoritesProduct;

  final FavoritesProductsApiModel _favoritesProduct;
  @override
  State<FavoritesCard> createState() => _FavoritesCardState();
}

class _FavoritesCardState extends State<FavoritesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(children: [
        Stack(
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.network(
                        widget._favoritesProduct.imageUrl,
                        fit: BoxFit.fill,
                        width: constraints.maxWidth,
                        height: 100,
                        alignment: Alignment.center,
                      )
                    ],
                  ));
            }),
            Positioned(
                top: 14,
                right: 14,
                child: GestureDetector(
                  onTap: () => context
                      .read<GeneralFavoritesViewModel>()
                      .handleTapFavorites(widget._favoritesProduct.id),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: AppColors.white2),
                    child: context
                            .watch<GeneralFavoritesViewModel>()
                            .isFavorites(widget._favoritesProduct.id)
                        ? Icon(Icons.favorite_rounded, color: AppColors.red1)
                        : Icon(
                            Icons.favorite_outline,
                            color: AppColors.grey5,
                          ),
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14, left: 14),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget._favoritesProduct.name,
              style: TextStyle(color: AppColors.customBlue, fontSize: 16),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14, left: 14),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.customBlue,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  'от ${widget._favoritesProduct.basePrice} ₽',
                  style: TextStyle(fontSize: 14, color: AppColors.white2),
                ),
              )),
        )
      ]),
    );
  }
}
