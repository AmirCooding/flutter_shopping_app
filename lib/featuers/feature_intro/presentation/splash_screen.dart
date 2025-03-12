import 'package:flutter/material.dart';
import 'package:ustore/common/constant/theme_helper.dart';
import 'package:ustore/theme/app_colors.dart';
import 'package:ustore/theme/app_font.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ThemeHelper.isDarkMode(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.backgroundDark : AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Image.asset(
                      isDarkMode
                          ? 'assets/images/text_logo_ustore_dark.png'
                          : 'assets/images/text_logo_ustore_light.png',
                      width: width * 0.8)),
              Text("data"),
              SizedBox(height: 30),
            ],
          ),
        ));
  }
}
