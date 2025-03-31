import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.pageController,
    required this.pageViewLength,
    this.dotHeight,
    this.dotWidth,
    this.spacing,
  });

  final PageController pageController;
  final int pageViewLength;
  final double? dotHeight;
  final double? dotWidth;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return Center(
      child: SmoothPageIndicator(
        controller: pageController,
        count: pageViewLength > 0 ? pageViewLength : 1,
        effect: ExpandingDotsEffect(
          dotColor: Colors.grey,
          activeDotColor:
              isDarkMode ? AppColors.accentDark : AppColors.accentLight,
          dotHeight: dotHeight ?? 10,
          dotWidth: dotWidth ?? 10,
          spacing: spacing ?? 6,
        ),
      ),
    );
  }
}
