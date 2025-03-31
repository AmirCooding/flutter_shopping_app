import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/featuers/home/presentation/screens/home_screen.dart';

class ShoeDrawer extends StatelessWidget {
  const ShoeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return Drawer(
      backgroundColor:
          isDarkMode ? AppColors.accentDark : AppColors.accentLight,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.accentDark : AppColors.accentLight,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
                Text(
                  'User Name',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed(HomeScreen.home);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Profile'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Settings'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            onTap: () {},
          ),
          Divider(),
        ],
      ),
    );
  }
}
