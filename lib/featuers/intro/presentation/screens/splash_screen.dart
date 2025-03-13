import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/constant/theme_helper.dart';
import 'package:ustore/featuers/intro/presentation/bloc/splash/splash_cubit.dart';
import 'package:ustore/theme/app_colors.dart';
import 'package:ustore/theme/app_font.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    // delayed calling BlocProvider
    Future.delayed(const Duration(milliseconds: 8000), () {
      BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
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
            debugPrint("Current State: ${state.connectionStatus}");

            if (state.connectionStatus is ConnectionOff) {
              debugPrint("Navigating to /no_internet");
              Navigator.pushReplacementNamed(context, '/no_internet');
            } else if (state.connectionStatus is ConnectionOn) {
              debugPrint(" Navigating to /home");
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          child: Center(
            child: DelayedWidget(
              delayDuration: const Duration(milliseconds: 500),
              animationDuration: const Duration(milliseconds: 3000),
              animation: DelayedAnimations.SLIDE_FROM_LEFT,
              child: Image.asset(
                  isDarkMode
                      ? 'assets/images/text_logo_ustore_dark.png'
                      : 'assets/images/text_logo_ustore_light.png',
                  width: width * 0.8),
            ),
          ),
        ));
  }
}
