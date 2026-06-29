import 'package:doza_flutter/data/services/models/products/products_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/view_models/catalog_view_model.dart';
import 'package:doza_flutter/ui/view_models/general_favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required ProductsApiModel product})
      : _product = product;

  final ProductsApiModel _product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.push('/product/${widget._product.id}'),
      child: Column(
        children: [
          Stack(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.network(
                          widget._product.imageUrl,
                          fit: BoxFit.fill,
                          width: constraints.maxWidth,
                          height: 200,
                          alignment: Alignment.center,
                        )
                      ],
                    ));
              }),
              Positioned(
                  top: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () => context
                        .read<GeneralFavoritesViewModel>()
                        .handleTapFavorites(widget._product.id),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: AppColors.white2),
                      child: context
                              .watch<GeneralFavoritesViewModel>()
                              .isFavorites(widget._product.id)
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
            padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget._product.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.customBlue,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Text(
                    widget._product.volumeMl.isNotEmpty
                        ? 'от ${widget._product.volumeMl.first} ₽'
                        : 'от ${widget._product.basePrice} ₽',
                    style: TextStyle(fontSize: 14, color: AppColors.white2),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context
                    .watch<CatalogViewModel>()
                    .getCategoryNameById(widget._product.categoryId),
                style: TextStyle(fontSize: 14, color: AppColors.grey4),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 16, bottom: 10, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget._product.volumeMl.isNotEmpty)
                  Row(
                      spacing: 4,
                      children: widget._product.volumeMl
                          .map((volume) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // backgroundBlendMode: BlendMode.lighten,
                                    color: AppColors.customBlue2),
                                child: Text(
                                  '$volume мл',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.customBlue),
                                ),
                              ))
                          .toList()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
