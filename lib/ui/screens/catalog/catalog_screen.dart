import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/catalog/widgets/categories/categories.dart';
import 'package:doza_flutter/ui/screens/catalog/widgets/products/products.dart';
import 'package:doza_flutter/ui/view_models/catalog_view_model.dart';
import 'package:doza_flutter/ui/widgets/search_input.dart';
import 'package:doza_flutter/ui/widgets/sort_catalog.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key, required CatalogViewModel catalogViewModel})
      : _catalogViewModel = catalogViewModel;

  final CatalogViewModel _catalogViewModel;

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                        listenable: widget._catalogViewModel,
                        builder: ((context, child) => Expanded(
                                child: SearchInput(
                              controller: widget
                                  ._catalogViewModel.searchInputController,
                              onSearch: () =>
                                  widget._catalogViewModel.handleSearch(),
                              isEnabled:
                                  widget._catalogViewModel.products.isNotEmpty,
                            )))),
                    SortCatalog()
                  ],
                ),
                Align(
                  alignment: AlignmentGeometry.centerStart,
                  child: Categories(
                    catalogViewModel: widget._catalogViewModel,
                  ),
                ),
                Expanded(
                    child: Products(
                  catalogViewModel: widget._catalogViewModel,
                  scrollController: _scrollController,
                ))
              ],
            ),
          )),
    );
  }
}
