import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ustore/common/constant/display_dimensions.dart';
import 'package:ustore/common/constant/theme_helper.dart';
import 'package:ustore/common/constant/prefs_operator.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/featuers/home/presentation/screens/home_screen.dart';
import 'package:ustore/featuers/intro/presentation/bloc/intro/intro_cubit.dart';
import 'package:ustore/featuers/intro/presentation/widgets/get_statrt_btn.dart';
import 'package:ustore/featuers/intro/presentation/widgets/intro_page.dart';
import 'package:ustore/common/utils/widgets/loading_screen.dart';
import 'package:ustore/locator.dart';

class IntroMainWrapper extends StatefulWidget {
  static const String introMainWrapper = '/intro_main_wrapper';

  const IntroMainWrapper({super.key});

  @override
  State<IntroMainWrapper> createState() => _IntroMainWrapperState();
}

class _IntroMainWrapperState extends State<IntroMainWrapper> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<IntroCubit>().getintroPagesData());
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    final width = screenWidth(context);
    final height = screenHeight(context);

    return BlocConsumer<IntroCubit, IntroState>(
      listener: (context, state) {
        if (state is IntroErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is IntroLoadingState) {
          return const LoadingScreen();
        }

        if (state is IntroLoadedState) {
          return Scaffold(
            body: Stack(
              children: [
                // background (changed page)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
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
                      child: Image.network(
                        state.introPage.isNotEmpty
                            ? state.introPage[currentIndex].image
                            : '',
                        width: width * 0.8,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child; // Bild ist vollständig geladen
                          }
                          return Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                                size: 30, color: AppColors.grey),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                              child: Icon(Icons.error, color: Colors.red));
                        },
                      ),
                    ),
                  ),
                ),

                // Seiten-Indikator
                Positioned(
                  bottom: height * 0.35,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: state.introPage.length,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: isDarkMode
                            ? AppColors.accentDark
                            : AppColors.accentLight,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                  ),
                ),

                // PageView (Intro-Seiten)
                Positioned(
                  bottom: height * 0.1,
                  width: width,
                  child: SizedBox(
                    width: width,
                    height: height * 0.2,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: state.introPage.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                        context.read<IntroCubit>().changePage(index);
                      },
                      itemBuilder: (context, index) {
                        final page = state.introPage[index];
                        return Intropage(
                          title: page.introLocalization.title,
                          description: page.introLocalization.description,
                        );
                      },
                    ),
                  ),
                ),

                // "Next" oder "Finish" Button
                Positioned(
                  bottom: height * 0.06,
                  right: width * 0.1,
                  child: GetStatrtBtn(
                    text: currentIndex < state.introPage.length - 1
                        ? "Next"
                        : "Finish",
                    onPressed: () {
                      if (currentIndex < state.introPage.length - 1) {
                        pageController.animateToPage(
                          currentIndex + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                        setState(() {
                          currentIndex += 1;
                        });
                        if (currentIndex == state.introPage.length - 1) {
                          final prefsOperator = locator<PrefsOperator>();
                          prefsOperator.changeIntroState();
                          log('Intro is shown --------> $prefsOperator.changeIntroState()');
                          context.read<IntroCubit>().changePage(currentIndex);
                        }
                        //  context.read<IntroCubit>().changePage(currentIndex);
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.home, (route) => false);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }

        return const Center(child: Text("Something went wrong!"));
      },
    );
  }
}
