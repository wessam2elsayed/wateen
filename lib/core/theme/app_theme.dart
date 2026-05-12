import 'package:flutter/material.dart';
import 'package:wateen/core/theme/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkblue,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.darkblue,
      unselectedItemColor: AppColors.gray
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.darkblue),
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
      )
    )

  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    cardColor: AppColors.darkGray,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkGray,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.white, 
        )
    ),
    iconTheme: IconThemeData(color: AppColors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkGray,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.gray
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.gray),
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.black),
      )
    )

  );
}