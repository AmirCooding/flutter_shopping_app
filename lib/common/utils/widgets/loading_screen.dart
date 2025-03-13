import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ustore/common/constant/theme_helper.dart';
import 'package:ustore/theme/app_colors.dart';
import 'package:ustore/theme/app_font.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.threeArchedCircle(
                size: 50, color: AppColors.grey),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Loading...',
              style: isDarkMode ? AppFont.darkBody : AppFont.lightBody,
            ),
          ],
        ),
      ),
    );
  }
}
