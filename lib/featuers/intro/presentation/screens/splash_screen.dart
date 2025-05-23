import 'dart:developer';

import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/gen/assets.gen.dart';
import 'package:ustore/utils/widgets/prefs_operator.dart';
import 'package:ustore/featuers/main_wrapper/presentation/screens/main_wrapper.dart';
import 'package:ustore/utils/widgets/no_internent.dart';
import 'package:ustore/featuers/intro/presentation/bloc/splash/splash_cubit.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/featuers/intro/presentation/screens/intro_main_wrapper.dart';
import 'package:ustore/locator.dart';

class SplashScreen extends StatefulWidget {
  static const String splash = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Using WidgetsBinding to ensure the context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 8000), () {
        if (mounted) {
          // Ensure widget is still mounted before accessing context
          context.read<SplashCubit>().checkConnectionEvent();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ThemeHelper.isDarkMode(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.backgroundDark : AppColors.background,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.connectionStatus is ConnectionOff) {
            Navigator.pushReplacementNamed(context, NoInternet.nointernet);
          } else if (state.connectionStatus is ConnectionOn) {
            final prefs = locator<PrefsOperator>();
            prefs.getIntroState().then((value) {
              if (value) {
                log('Intro is shown --------> $value');
                Navigator.pushReplacementNamed(
                    // ignore: use_build_context_synchronously
                    context,
                    MainWrapper.mainWrapper);
              } else {
                Navigator.pushReplacementNamed(
                    // ignore: use_build_context_synchronously
                    context,
                    IntroMainWrapper.introMainWrapper);
              }
            });
          }
        },
        child: Center(
          child: DelayedWidget(
            delayDuration: const Duration(milliseconds: 500),
            animationDuration: const Duration(milliseconds: 3000),
            animation: DelayedAnimations.SLIDE_FROM_LEFT,
            child: Assets.images.ustoreTextLogo.image(width: width * 0.8),
          ),
        ),
      ),
    );
  }
}
