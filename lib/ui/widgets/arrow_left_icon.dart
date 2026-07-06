import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ArrowLeftIcon extends StatelessWidget {
  const ArrowLeftIcon(
      {super.key,
      Color? backgroundColor,
      Color? iconColor,
      required void Function() onClick})
      : _onClick = onClick,
        _iconColor = iconColor,
        _backgroundColor = backgroundColor;

  final void Function() _onClick;
  final Color? _backgroundColor;
  final Color? _iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onClick,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: _backgroundColor ?? AppColors.white2),
        child: Icon(
          size: 34,
          Icons.keyboard_arrow_left,
          color: _iconColor ?? AppColors.grey5,
        ),
      ),
    );
  }
}
