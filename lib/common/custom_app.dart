import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/config/theme/app_font.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Icon? icon;

  const CustomAppBar({super.key, this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return AppBar(
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.back,
          color: isDarkMode ? AppColors.accentDark : AppColors.accentLight,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title ?? '',
        style: isDarkMode ? AppFont.darkHeading : AppFont.lightHeading,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: icon ?? SizedBox.shrink(),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
