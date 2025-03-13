import 'package:flutter/material.dart';
import 'package:ustore/common/constant/theme_helper.dart';
import 'package:ustore/theme/app_colors.dart';
import 'package:ustore/theme/app_font.dart';

class NoInternent extends StatelessWidget {
  const NoInternent({super.key});
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              size: 100,
              color: AppColors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Text('No Internet Connection',
                style: isDarkMode ? AppFont.darkBody : AppFont.lightBody),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please check your internet connection',
              style: isDarkMode ? AppFont.darkBody : AppFont.lightBody,
            ),
          ],
        ),
      ),
    );
  }
}
