import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class InputDecorationCustom extends InputDecoration {
  InputDecorationCustom({
    required String super.labelText,
    super.hintText,
    super.helperText,
    super.prefixIcon,
    super.suffixIcon,
  }) : super(
          labelStyle: TextStyle(color: AppColors.customBlue7),
          helperStyle: TextStyle(color: AppColors.customBlue3),
          hintStyle: TextStyle(color: AppColors.customBlue3),
          errorStyle: TextStyle(color: AppColors.red1),
          filled: true,
          fillColor: AppColors.customBlue1,
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );
}
