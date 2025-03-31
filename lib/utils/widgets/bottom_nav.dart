import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/utils/bloc/bottom_nav/bottom_nav_cubit.dart';
import 'package:ustore/config/theme/app_colors.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;
  const BottomNav({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, int state) {
          return Column(
            children: [
              SizedBox(
                height: kBottomNavigationBarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavBarItem(
                        controller: controller,
                        stateIndex: 0,
                        locale1: 'StartSeite',
                        locale2: 'Home',
                        selecteditemsIcon: CupertinoIcons.house_fill,
                        unselecteditemsIcon: CupertinoIcons.house),
                    NavBarItem(
                        controller: controller,
                        stateIndex: 1,
                        locale1: 'Kategorie',
                        locale2: 'Category',
                        selecteditemsIcon: CupertinoIcons.circle_grid_hex_fill,
                        unselecteditemsIcon: CupertinoIcons.circle_grid_hex),
                    NavBarItem(
                        controller: controller,
                        stateIndex: 2,
                        locale1: 'Favorit',
                        locale2: 'Favorite',
                        selecteditemsIcon: CupertinoIcons.heart_fill,
                        unselecteditemsIcon: CupertinoIcons.heart),
                    NavBarItem(
                        controller: controller,
                        stateIndex: 3,
                        locale1: 'Einstellung',
                        locale2: 'Setting',
                        selecteditemsIcon: CupertinoIcons.gear_alt_fill,
                        unselecteditemsIcon: CupertinoIcons.gear_alt),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final PageController controller;
  final int stateIndex;
  final String locale1;
  final String locale2;
  final IconData? selecteditemsIcon;
  final IconData? unselecteditemsIcon;

  const NavBarItem({
    super.key,
    required this.controller,
    required this.stateIndex,
    required this.locale1,
    required this.locale2,
    required this.selecteditemsIcon,
    required this.unselecteditemsIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkeMode = ThemeHelper.isDarkMode(context);
    final locale = LanguageManager().locale;
    final bottomNavCubit = BlocProvider.of<BottomNavCubit>(context);

    return InkWell(
      onTap: () {
        controller.animateToPage(stateIndex,
            duration: Duration(milliseconds: 500), curve: Curves.easeInSine);
        bottomNavCubit.changeSelectedIndex(stateIndex);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            stateIndex == bottomNavCubit.state
                ? selecteditemsIcon
                : unselecteditemsIcon,
            color: stateIndex == bottomNavCubit.state
                ? (isDarkeMode ? AppColors.accentDark : AppColors.accentLight)
                : (isDarkeMode ? AppColors.greyLight : AppColors.greyDark),
          ),
          SizedBox(height: 5),
          Text(
            locale == 'de' ? locale1 : locale2,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: stateIndex == bottomNavCubit.state
                ? TextStyle(
                    fontSize: 14,
                    color: isDarkeMode
                        ? AppColors.accentDark
                        : AppColors.accentLight)
                : TextStyle(
                    fontSize: 14,
                    color:
                        isDarkeMode ? AppColors.greyLight : AppColors.greyDark),
          ),
        ],
      ),
    );
  }
}
