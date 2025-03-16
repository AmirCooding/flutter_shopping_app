import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ustore/common/constant/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/config/theme/app_font.dart';

class Intropage extends StatelessWidget {
  final String title;
  final String description;
  const Intropage({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DelayedWidget(
              delayDuration: const Duration(milliseconds: 500),
              animationDuration: const Duration(seconds: 1),
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
              child: Text(title,
                  style:
                      isDarkMode ? AppFont.darkHeading : AppFont.lightHeading)),
          SizedBox(height: 20),
          DelayedWidget(
              delayDuration: const Duration(milliseconds: 500),
              animationDuration: const Duration(seconds: 1),
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
              child: Shimmer.fromColors(
                  baseColor: isDarkMode ? AppColors.greyLight : AppColors.grey,
                  highlightColor: isDarkMode
                      ? AppColors.textSecondary
                      : AppColors.textBlack,
                  child: Text(description, style: AppFont.lightBody))),
        ],
      ),
    );
  }
}
