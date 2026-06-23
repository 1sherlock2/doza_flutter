import 'package:doza_flutter/ui/catalog/view_model/catalog_view_model.dart';
import 'package:doza_flutter/ui/catalog/widgets/categories/categories_item.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key, required CatalogViewModel catalogViewModel})
      : _catalogViewModel = catalogViewModel;

  final CatalogViewModel _catalogViewModel;

  @override
  State<Categories> createState() => _FilterCatalogState();
}

class _FilterCatalogState extends State<Categories> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget._catalogViewModel,
        builder: (context, _) {
          return Scrollbar(
              controller: _scrollController,
              thickness: 1,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...widget._catalogViewModel.categories
                          .map((category) => Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 20, top: 20),
                                child: CategoriesItem(
                                    name: category.name,
                                    categoryId: category.id,
                                    imageUrl: category.imageUrl,
                                    description: category.desctiprion,
                                    onSelected:
                                        widget._catalogViewModel.toggleCategory,
                                    isSelected: widget._catalogViewModel
                                        .isSelected(category.id)),
                              ))
                    ]),
              ));
        });
  }
}
