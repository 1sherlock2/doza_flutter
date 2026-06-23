import 'package:doza_flutter/ui/catalog/view_model/catalog_view_model.dart';
import 'package:doza_flutter/ui/catalog/widgets/products/product_card.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key, required CatalogViewModel catalogViewModel})
      : _catalogViewModel = catalogViewModel;

  final CatalogViewModel _catalogViewModel;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._catalogViewModel.filteredProducts.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          'Не найдено товаров',
          style: TextStyle(color: AppColors.black1),
        ),
      );
    }
    return ListenableBuilder(
        listenable: widget._catalogViewModel,
        builder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: GridView.count(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  controller: _scrollController,
                  mainAxisExtent: 300,
                  scrollDirection: Axis.vertical,
                  children: widget._catalogViewModel.filteredProducts
                      .map((product) => Card.filled(
                            elevation: 1,
                            shadowColor: AppColors.grey5,
                            borderOnForeground: true,
                            child: ProductCard(product: product),
                          ))
                      .toList()),
            ));
  }
}
