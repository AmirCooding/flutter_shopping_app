import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/constant/theme_helper.dart';
import 'package:ustore/featuers/intro/presentation/bloc/splash/splash_cubit.dart';
import 'package:ustore/theme/app_colors.dart';
import 'package:ustore/theme/app_font.dart';

class NoInternet extends StatelessWidget {
  static const String nointernet = '/no_internet';
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);

    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.connectionStatus is ConnectionOn) {
            Navigator.pushReplacementNamed(context, '/home_screen');
          }
        },
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off,
                    size: 100,
                    color: AppColors.grey,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'No Internet Connection',
                    style: isDarkMode ? AppFont.darkBody : AppFont.lightBody,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Please check your internet connection',
                    style: isDarkMode ? AppFont.darkBody : AppFont.lightBody,
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                    onPressed: () {
                      context.read<SplashCubit>().checkConnectionEvent();
                    },
                    icon: Icon(
                      CupertinoIcons.refresh,
                      size: 30,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Status: ${state.connectionStatus.runtimeType}",
                    style: isDarkMode ? AppFont.darkBody : AppFont.lightBody,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
