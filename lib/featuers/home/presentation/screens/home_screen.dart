import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/featuers/home/presentation/bloc/home_cubit.dart';
import 'package:ustore/featuers/home/presentation/widgets/banner_screen.dart';
import 'package:ustore/featuers/home/presentation/widgets/search_box_screen.dart';
import 'package:ustore/featuers/home/presentation/widgets/show_drawer.dart';
import 'package:ustore/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  static const String home = '/home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().callBanerImages();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return Scaffold(
      drawer: ShoeDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Builder(
                builder: (context) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            Assets.images.blankProfile,
                            width: 35,
                          ),
                          Assets.images.ustoreTextLogo.image(width: 170),
                          Stack(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.cart,
                                  size: 30,
                                  color: isDarkMode
                                      ? AppColors.greyLight
                                      : AppColors.greyDark,
                                ),
                              ),
                              Positioned(
                                right: 4,
                                top: 4,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: AppColors.error,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '3',
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
                        ],
                      ),
                      SizedBox(height: 20),
                      SearchBoxScreen(),
                      SizedBox(height: 20),
                      BannerScreen(
                        baners: state.bannerImages,
                        pageController:
                            context.read<HomeCubit>().pageController,
                        pageViewLength: state.bannerImages.length,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
