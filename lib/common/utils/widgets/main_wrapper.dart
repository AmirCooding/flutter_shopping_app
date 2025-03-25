import 'package:flutter/material.dart';
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
      body: PageView(
        controller: pageController,
        children: [
          HomeScreen(),
          CategroyScreen(),
          FavoriteScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}
