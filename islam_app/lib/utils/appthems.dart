import 'package:flutter/material.dart';


import 'app_colors.dart';

class AppThems {
  static ThemeData apptheme = ThemeData(
    scaffoldBackgroundColor: AppColor.scaffoldTransparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColor.whiteiconElevatedBg,
        unselectedItemColor: AppColor.blakeIconElevatedBg),
  );
}
