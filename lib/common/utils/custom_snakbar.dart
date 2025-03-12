import 'package:flutter/material.dart';
import 'package:ustore/theme/app_colors.dart';

class CustomSnakbar {
  static showSnackSuccess(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.success),
    );
  }

  static showSnackError(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }
}
