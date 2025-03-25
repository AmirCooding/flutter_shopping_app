import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/utils/bloc/bottom_nav/bottom_nav_cubit.dart';
import 'package:ustore/common/utils/widgets/bottom_nav.dart';
import 'package:ustore/featuers/category/presentation/screens/categroy_screen.dart';
import 'package:ustore/featuers/favorite/presentation/screens/favorite_screen.dart';
import 'package:ustore/featuers/home/presentation/screens/home_screen.dart';
import 'package:ustore/featuers/setting/presentation/Screens/setting_screen.dart';

class MainWrapper extends StatelessWidget {
  static const String mainWrapper = '/MainWrapper';
  final PageController pageController = PageController();
  MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(controller: pageController),
      body: BlocListener<BottomNavCubit, int>(
        listener: (context, state) {
          pageController.jumpToPage(state);
        },
        child: PageView(
          controller: pageController,
          onPageChanged: (index) =>
              context.read<BottomNavCubit>().changeSelectedIndex(index),
          children: [
            HomeScreen(),
            CategroyScreen(),
            FavoriteScreen(),
            SettingScreen(),
          ],
        ),
      ),
    );
  }
}
