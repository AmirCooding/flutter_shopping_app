import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';

class SearchBoxScreen extends StatelessWidget {
  const SearchBoxScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    final locale = LanguageManager().locale;
    return SizedBox(
      width: double.infinity,
      height: 43,
      child: TextField(
        cursorColor: isDarkMode ? AppColors.greyLight : AppColors.greyDark,
        cursorHeight: 14,
        style: TextStyle(
          color: isDarkMode ? AppColors.greyLight : AppColors.greyDark,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          // filled: true,
          //fillColor: isDarkMode ? AppColors.greyLight : AppColors.textWhite,
          hintText: locale == 'de' ? 'Suche...' : 'Search...',
          hintStyle: TextStyle(
              color: isDarkMode ? AppColors.greyLight : AppColors.greyDark,
              fontFamily: 'Poppins',
              fontSize: 14),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: isDarkMode ? AppColors.greyLight : AppColors.greyDark,
            size: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: isDarkMode ? AppColors.greyLight : AppColors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: isDarkMode ? AppColors.greyLight : AppColors.greyDark,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
