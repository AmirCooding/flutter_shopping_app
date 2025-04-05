import 'package:flutter/material.dart';
import 'package:ustore/config/theme/app_colors.dart';

class CustomSnakbar {
  static showSnackSuccess(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            message,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.background,
            ),
          ),
          backgroundColor: AppColors.success),
    );
  }

  static showSnackError(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            message,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.background,
            ),
          ),
          backgroundColor: AppColors.error),
    );
  }
}
