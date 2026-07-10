import 'package:flutter/material.dart';

final class AppColors {
  static const white1 = Color(0xFFFFFFFF);
  static const white2 = Color.fromARGB(255, 243, 246, 249);

  static final green1 = Colors.lightGreen[100];
  static final green2 = Colors.lightGreen[200];
  static final green3 = Colors.lightGreen[300];
  static final green4 = Colors.lightGreen[400];
  static final green5 = Colors.lightGreen[500];
  static final green6 = Colors.lightGreen[600];

  static final grey1 = Colors.grey[100];
  static final grey2 = Colors.grey[200];
  static final grey3 = Colors.grey[300];
  static final grey4 = Colors.grey[400];
  static final grey5 = Colors.grey[500];

  static const black1 = Color.fromARGB(48, 38, 36, 1);
  static const lightBrown = Color.fromARGB(255, 229, 228, 201);
  static const brown = Color.fromARGB(52, 25, 4, 1);
  static const customBlue = Color.fromRGBO(64, 83, 98, 1.0);
  static const customBlue1 = Color.fromRGBO(238, 243, 247, 1);
  static const customBlue2 = Color.fromRGBO(235, 242, 248, 1);
  static const customBlue3 = Color.fromRGBO(92, 109, 121, 1);
  static const customBlue4 = Color.fromRGBO(64, 83, 98, 1);
  static const customBlue5 = Color.fromRGBO(223, 229, 233, 1);
  static const customBlue6 = Color.fromRGBO(245, 249, 252, 1);
  static const customBlue7 = Color.fromARGB(255, 163, 180, 191);
  static const customBlue8 = Color.fromARGB(255, 136, 198, 239);

  static const red1 = Color(0xFFE74C3C);
  static const red2 = Color.fromARGB(255, 251, 242, 241);
  static const red3 = Color.fromRGBO(243, 222, 222, 1);
  static const red4 = Color.fromRGBO(236, 174, 174, 1);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.white1,
    onPrimary: AppColors.white1,
    secondary: AppColors.customBlue,
    onSecondary: AppColors.lightBrown,
    error: AppColors.red2,
    onError: AppColors.red1,
    surface: Colors.white,
    onSurface: Colors.black,
  );
}
