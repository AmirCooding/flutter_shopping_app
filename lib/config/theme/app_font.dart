import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppFont {
  static const String fontFamily = 'Poppins';

  // **Light Theme Text Styles**
  static TextStyle lightHeading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400, // 700
    color: AppColors.greyDark,
  );

  static TextStyle ligthTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.grey,
  );

  static TextStyle lightHeading2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600, // 700
    color: AppColors.greyDark,
  );

  static const TextStyle lightSubheading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600, // 600
    color: AppColors.greyDark,
  );

  static const TextStyle lightBody = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400, // 400
    color: AppColors.greyDark,
  );

  static const TextStyle lightCaption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w300, // 300
    color: AppColors.greyDark,
  );
  static TextStyle darkTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.greyLight,
  );

  // **Dark Theme Text Styles**
  static const TextStyle darkHeading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold, // 700
    color: AppColors.greyLight,
  );
  static const TextStyle darkHeading2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.grey,
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
    color: AppColors.grey,
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

  // **onbarding Styles**
  static const TextStyle onboarding = TextStyle(
    fontFamily: fontFamily,
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    color: AppColors.greyLight,
    shadows: [
      Shadow(
        blurRadius: 10.0,
        color: Colors.black54,
        offset: Offset(2.0, 2.0),
      ),
    ],
  );

  static const TextStyle italicCaption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w300, // Light
    fontStyle: FontStyle.italic,
    color: AppColors.greyDark,
  );

  static const TextStyle getStatrtBtn = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w400, // Light
    fontStyle: FontStyle.normal,
    color: AppColors.textWhite,
  );
}
