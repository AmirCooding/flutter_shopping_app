import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/featuers/main_wrapper/presentation/cubit/main_wrapper_cubit.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/featuers/main_wrapper/presentation/cubit/main_wrapper_data_status.dart';

class BottomNav extends StatelessWidget {
  final PageController controller;

  const BottomNav({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: BlocConsumer<MainWrapperCubit, MainWrapperState>(
        listener: (context, state) {
          if (state.dataStatus is MainWrapperDataLoaded) {
            DOTO: // Handle logic on favorites count change if needed
            final favoritesCount =
                (state.dataStatus as MainWrapperDataLoaded).favoritesCount;
          }
        },
        builder: (context, state) {
          final currentIndex = state.selectedIndex;
          int favoritesCount = 0;

          if (state.dataStatus is MainWrapperDataLoaded) {
            favoritesCount =
                (state.dataStatus as MainWrapperDataLoaded).favoritesCount;
          }

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
                      currentIndex: currentIndex,
                      locale1: 'StartSeite',
                      locale2: 'Home',
                      selecteditemsIcon: CupertinoIcons.house_fill,
                      unselecteditemsIcon: CupertinoIcons.house,
                      onTap: () {
                        context.read<MainWrapperCubit>().updateSelectedIndex(0);
                        controller.animateToPage(0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInSine);
                      },
                    ),
                    NavBarItem(
                      controller: controller,
                      stateIndex: 1,
                      currentIndex: currentIndex,
                      locale1: 'Kategorie',
                      locale2: 'Category',
                      selecteditemsIcon: CupertinoIcons.circle_grid_hex_fill,
                      unselecteditemsIcon: CupertinoIcons.circle_grid_hex,
                      onTap: () {
                        context.read<MainWrapperCubit>().updateSelectedIndex(1);
                        controller.animateToPage(1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInSine);
                      },
                    ),
                    Stack(
                      children: [
                        NavBarItem(
                          controller: controller,
                          stateIndex: 2,
                          currentIndex: currentIndex,
                          locale1: 'Favorit',
                          locale2: 'Favorite',
                          selecteditemsIcon: CupertinoIcons.heart_fill,
                          unselecteditemsIcon: CupertinoIcons.heart,
                          onTap: () {
                            context
                                .read<MainWrapperCubit>()
                                .updateSelectedIndex(2);
                            controller.animateToPage(2,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInSine);
                          },
                        ),
                        if (favoritesCount >
                            0) // Only show when there are favorites
                          Positioned(
                            right: 4,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: AppColors.error,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  "$favoritesCount",
                                  style: TextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    NavBarItem(
                      controller: controller,
                      stateIndex: 3,
                      currentIndex: currentIndex,
                      locale1: 'Einstellung',
                      locale2: 'Setting',
                      selecteditemsIcon: CupertinoIcons.gear_alt_fill,
                      unselecteditemsIcon: CupertinoIcons.gear_alt,
                      onTap: () {
                        context.read<MainWrapperCubit>().updateSelectedIndex(3);
                        controller.animateToPage(3,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInSine);
                      },
                    ),
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
  final int currentIndex;
  final String locale1;
  final String locale2;
  final IconData? selecteditemsIcon;
  final IconData? unselecteditemsIcon;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.controller,
    required this.stateIndex,
    required this.currentIndex,
    required this.locale1,
    required this.locale2,
    required this.selecteditemsIcon,
    required this.unselecteditemsIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    final locale = LanguageManager().locale;

    final isSelected = stateIndex == currentIndex;

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? selecteditemsIcon : unselecteditemsIcon,
            color: isSelected
                ? (isDarkMode ? AppColors.accentDark : AppColors.accentLight)
                : (isDarkMode ? AppColors.greyLight : AppColors.greyDark),
          ),
          SizedBox(height: 5),
          Text(
            locale == 'de' ? locale1 : locale2,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: isSelected
                  ? (isDarkMode ? AppColors.accentDark : AppColors.accentLight)
                  : (isDarkMode ? AppColors.greyLight : AppColors.greyDark),
            ),
          ),
        ],
      ),
    );
  }
}
