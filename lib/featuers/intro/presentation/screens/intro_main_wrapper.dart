import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ustore/common/constant/display_dimensions.dart';
import 'package:ustore/common/constant/theme_helper.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/intro_firebase_service.dart';
import 'package:ustore/featuers/intro/presentation/bloc/intro/intro_cubit.dart';
import 'package:ustore/featuers/intro/presentation/widgets/get_statrt_btn.dart';
import 'package:ustore/featuers/intro/presentation/widgets/intro_page.dart';
import 'package:ustore/featuers/intro/repository/intro_repository_impl.dart';
import 'package:ustore/featuers/intro/usecase/intro_usecase.dart';
import 'package:ustore/gen/assets.gen.dart';
import 'package:ustore/config/theme/app_colors.dart';

class IntroMainWrapper extends StatelessWidget {
  static const String introMainWrapper = '/intro_main_wrapper';
  final PageController pageController = PageController();

  IntroMainWrapper({super.key});

  final List<String> images = [
    Assets.images.onboarding1.path,
    Assets.images.onboarding2.path,
    Assets.images.onboarding3.path,
  ];

  final List<Widget> introPages = [
    Intropage(
      title: "Clothing",
      description:
          "Discover a wide range of stylish clothing for every occasion. Find the latest trends and timeless fashion to complete your perfect look.",
    ),
    Intropage(
      title: "Jewelry",
      description:
          "Elegant jewelry pieces to enhance your style. From sparkling rings to sophisticated necklaces, find the perfect accessory for any outfit.",
    ),
    Intropage(
      title: "Appliances",
      description:
          "High-quality home appliances designed to make your life easier. Explore innovative technology for your kitchen, cleaning, and more.",
    ),
  ];

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
            child: BlocBuilder<IntroCubit, IntroState>(
              builder: (context, state) {
                return Container(
                  height: height * 0.6,
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.accentDark
                        : AppColors.accentLight,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(150),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(images[0], width: width * 0.8),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: height * 0.35,
            left: 0,
            right: 0,
            child: BlocBuilder<IntroCubit, IntroState>(
              builder: (context, state) {
                return Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: introPages.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: isDarkMode
                          ? AppColors.accentDark
                          : AppColors.accentLight,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                );
              },
            ),
          ),

          // PageView für Intro-Seiten
          Positioned(
            bottom: height * 0.1,
            width: width,
            child: SizedBox(
              width: width,
              height: height * 0.2,
              child: PageView.builder(
                controller: pageController,
                itemCount: introPages.length,
                onPageChanged: (index) {},
                itemBuilder: (context, index) {
                  return introPages[index];
                },
              ),
            ),
          ),

          Positioned(
            bottom: height * 0.06,
            right: width * 0.1,
            child: BlocBuilder<IntroCubit, IntroState>(
              builder: (context, state) {
                return GetStatrtBtn(
                  text: 0 < introPages.length - 1 ? "Next" : "Finish",
                  onPressed: () {
                    if (0 < introPages.length - 1) {
                      pageController.animateToPage(
                        0 + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, '/home_screen');
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
