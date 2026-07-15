import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ScrollBarCustom extends StatelessWidget {
  const ScrollBarCustom({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
        data: ScrollbarThemeData(
            thumbColor: WidgetStateProperty<Color>.fromMap({
          WidgetState.any: AppColors.customBlue7,
          WidgetState.scrolledUnder: AppColors.customBlue7,
          WidgetState.dragged: AppColors.customBlue4
        })),
        child: Scrollbar(
            thumbVisibility: true,
            child: Padding(
                padding: const EdgeInsets.only(right: 10), child: child)));
  }
}
