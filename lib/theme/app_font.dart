import 'package:flutter/material.dart';
import 'app_colors.dart'; // Stelle sicher, dass du deine AppColors importierst

class AppFont {
  static const String fontFamily = 'Poppins';

  // **Light Theme Text Styles**
  static const TextStyle lightHeading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold, // 700
    color: AppColors.textPrimary,
  );

  static const TextStyle lightSubheading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600, // 600
    color: AppColors.textPrimary,
  );

  static const TextStyle lightBody = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400, // 400
    color: AppColors.textSecondary,
  );

  static const TextStyle lightCaption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w300, // 300
    color: AppColors.greyDark,
  );

  // **Dark Theme Text Styles**
  static const TextStyle darkHeading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold, // 700
    color: AppColors.textWhite,
  );

  static const TextStyle darkSubheading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600, // 600
    color: AppColors.textWhite,
  );

  static const TextStyle darkBody = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400, // 400
    color: AppColors.textSecondary,
  );

  static const TextStyle darkCaption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w300, // 300
    color: AppColors.greyLight,
  );

  // **Italic Styles**
  static const TextStyle italicBody = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400, // Regular
    fontStyle: FontStyle.italic,
    color: AppColors.textPrimary,
  );

  static const TextStyle italicCaption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w300, // Light
    fontStyle: FontStyle.italic,
    color: AppColors.greyDark,
  );
}
