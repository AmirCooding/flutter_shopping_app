import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppFont {
  static const String fontFamily = 'Poppins';

  // **Light Theme Text Styles**
  static TextStyle lightHeading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle lightSubheading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle lightBody = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle lightCaption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.greyDark,
  );

  // **Dark Theme Text Styles**
  static TextStyle darkHeading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );

  static TextStyle darkSubheading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  static TextStyle darkBody = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle darkCaption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.greyLight,
  );
}
