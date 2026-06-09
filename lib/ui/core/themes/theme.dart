import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.customBlue,
      selectionColor: Colors.blue, // цвет выделения
      selectionHandleColor: Colors.blue, // цвет ручек
    ),
  );
}
