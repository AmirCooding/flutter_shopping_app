import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_font.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.background,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
    textTheme: TextTheme(
      headlineLarge: AppFont.lightHeading,
      headlineMedium: AppFont.lightSubheading,
      bodyLarge: AppFont.lightBody,
      bodySmall: AppFont.lightCaption,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      titleTextStyle: AppFont.lightHeading.copyWith(color: Colors.white),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryDark,
      secondary: AppColors.secondaryDark,
      surface: AppColors.backgroundDark,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ),
    textTheme: TextTheme(
      headlineLarge: AppFont.darkHeading,
      headlineMedium: AppFont.darkSubheading,
      bodyLarge: AppFont.darkBody,
      bodySmall: AppFont.darkCaption,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentDark,
        foregroundColor: Colors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      titleTextStyle: AppFont.darkHeading.copyWith(color: Colors.white),
    ),
  );
}
