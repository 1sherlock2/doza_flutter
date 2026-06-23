import 'package:doza_flutter/ui/catalog/view_model/catalog_view_model.dart';
import 'package:doza_flutter/ui/catalog/widgets/categories/categories.dart';
import 'package:doza_flutter/ui/catalog/widgets/products/products.dart';
import 'package:doza_flutter/ui/catalog/widgets/sort_catalog.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({
    super.key,
  });

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  void onTapHandler() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapHandler,
        child: Container(
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
                        Expanded(
                            child: SearchInput(
                          controller: context
                              .watch<CatalogViewModel>()
                              .searchInputController,
                          onSearch: () =>
                              context.read<CatalogViewModel>().handleSearch(),
                        )),
                        SortCatalog()
                      ],
                    ),
                    Align(
                      alignment: AlignmentGeometry.centerStart,
                      child: Categories(
                        catalogViewModel: context.watch<CatalogViewModel>(),
                      ),
                    ),
                    Expanded(
                        child: Products(
                            catalogViewModel:
                                context.watch<CatalogViewModel>()))
                  ],
                ),
              )),
        ));
  }
}
