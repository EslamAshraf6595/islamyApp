import 'package:flutter/material.dart';
import 'package:islamiapp/utils/app_colors.dart';
import 'package:islamiapp/utils/app_styles.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparetColor,
    canvasColor: AppColors.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    ),
    textTheme: TextTheme(headlineLarge: AppStyles.bold16White),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blackDetailsByColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );
}
