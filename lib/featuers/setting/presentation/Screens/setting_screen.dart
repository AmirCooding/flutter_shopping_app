import 'package:flutter/material.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/utils/widgets/custom_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomButton(
              text: "Sign Up",
              textColor: AppColors.textWhite,
              backgroundColor: AppColors.error,
              onPressed: () {})),
    );
  }
}
