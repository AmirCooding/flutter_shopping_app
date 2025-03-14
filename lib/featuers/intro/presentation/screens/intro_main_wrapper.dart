import 'package:flutter/material.dart';
import 'package:ustore/common/constant/display_dimensions.dart';
import 'package:ustore/common/constant/theme_helper.dart';
import 'package:ustore/featuers/intro/presentation/widgets/intro_page.dart';
import 'package:ustore/theme/app_colors.dart';
import 'package:ustore/theme/app_font.dart';

class IntroMainWrapper extends StatelessWidget {
  static const String introMainWrapper = '/intro_main_wrapper';
  const IntroMainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    final width = screenWidth(context);
    final height = screenHeight(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.6,
              decoration: BoxDecoration(
                color:
                    isDarkMode ? AppColors.accentDark : AppColors.accentLight,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(150),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/onboarding1.png',
                  width: width * 0.8,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.1,
            width: width,
            child: SizedBox(
              width: width,
              height: height * 0.2,
              child: Intropage(
                title: "Clothing",
                description:
                    "adfesgrdhstfjdzkufljthrgefwaegrshtjdfzgnbdvsafgdfghmgn",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
