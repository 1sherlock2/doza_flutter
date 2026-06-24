import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CategoriesItem extends StatefulWidget {
  const CategoriesItem(
      {super.key,
      required this.name,
      required this.categoryId,
      this.imageUrl,
      this.description,
      required this.onSelected,
      required this.isSelected});

  final String name;
  final int categoryId;
  final String? imageUrl;
  final String? description;
  final void Function(int) onSelected;
  final bool isSelected;

  @override
  State<CategoriesItem> createState() => _CategoriesItemState();
}

class _CategoriesItemState extends State<CategoriesItem> {
  void handleSelected(bool selected) {
    widget.onSelected(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        label: Text(widget.name),
        selectedColor: AppColors.customBlue,
        selected: widget.isSelected,
        onSelected: handleSelected);
  }
}
