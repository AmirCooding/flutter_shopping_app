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
      backgroundColor: Colors.transparent,
      titleTextStyle: AppFont.lightHeading,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.accentLight,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.greyLight,
      thickness: 1,
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
        backgroundColor: Colors.transparent,
        titleTextStyle: AppFont.darkHeading),
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.accentDark,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.greyDark,
      thickness: 1,
    ),
  );
}
