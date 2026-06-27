import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/catalog/view_models/catalog_view_model.dart';
import 'package:doza_flutter/ui/screens/catalog/widgets/products/product_card.dart';
import 'package:doza_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products(
      {super.key,
      required CatalogViewModel catalogViewModel,
      required ScrollController scrollController})
      : _catalogViewModel = catalogViewModel,
        _scrollController = scrollController;

  final CatalogViewModel _catalogViewModel;
  final ScrollController _scrollController;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget._catalogViewModel,
        builder: (context, index) {
          if (widget._catalogViewModel.filteredProducts.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Не найдено товаров',
                style: TextStyle(color: AppColors.black1),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GridView.count(
                key: const PageStorageKey(ConstantsEnum.catalogProductsGrid),
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                controller: widget._scrollController,
                mainAxisExtent: 330,
                scrollDirection: Axis.vertical,
                children: widget._catalogViewModel.filteredProducts
                    .map((product) => Card.filled(
                          elevation: 1,
                          shadowColor: AppColors.grey5,
                          borderOnForeground: true,
                          child: ProductCard(product: product),
                        ))
                    .toList()),
          );
        });
  }
}
