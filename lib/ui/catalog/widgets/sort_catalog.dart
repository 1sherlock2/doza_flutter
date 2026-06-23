import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class SortCatalog extends StatefulWidget {
  const SortCatalog({super.key});

  @override
  State<SortCatalog> createState() => _SortCatalogState();
}

class _SortCatalogState extends State<SortCatalog> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
          color: AppColors.customBlue2,
          borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
      child: PopupMenuButton(
        position: PopupMenuPosition.under,
        icon: Icon(Icons.sort_outlined),
        iconSize: 30,
        borderRadius: BorderRadius.all(Radius.zero),
        shadowColor: AppColors.customBlue2,
        menuPadding: const EdgeInsets.all(10),
        onSelected: (value) => setState(() {
          _selectedItem = value.toString();
        }),
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            value: 'popular',
            child: Text(
              'По популярности',
              style: TextStyle(
                  decorationColor: AppColors.customBlue,
                  decoration: _selectedItem == 'popular'
                      ? TextDecoration.underline
                      : null),
            ),
          ),
          PopupMenuItem(
              value: 'price',
              child: Text(
                'По цене',
                style: TextStyle(
                    decorationColor: AppColors.customBlue,
                    decoration: _selectedItem == 'price'
                        ? TextDecoration.underline
                        : null),
              )),
          PopupMenuItem(
              value: 'alphabet',
              child: Text('По алфавиту',
                  style: TextStyle(
                      decorationColor: AppColors.customBlue,
                      decoration: _selectedItem == 'alphabet'
                          ? TextDecoration.underline
                          : null)))
        ],
      ),
    );
  }
}
// GestureDetector(
//         child: Container(
//       height: 56,
//       padding: const EdgeInsetsGeometry.all(8),
//       decoration: BoxDecoration(
//         color: AppColors.customBlue2,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Icon(Icons.sort_outlined),
//     ))
