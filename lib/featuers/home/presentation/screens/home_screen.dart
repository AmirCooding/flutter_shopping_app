import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ustore/utils/widgets/custom_snakbar.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/featuers/home/presentation/bloc/home_cubit.dart';
import 'package:ustore/featuers/home/presentation/bloc/home_data_status.dart';
import 'package:ustore/featuers/home/presentation/widgets/banner_screen.dart';
import 'package:ustore/featuers/home/presentation/widgets/search_box_screen.dart';
import 'package:ustore/gen/assets.gen.dart';
import 'package:ustore/locator.dart';
import 'package:ustore/utils/widgets/loading_screen.dart';
import 'package:ustore/utils/widgets/product_cart_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String home = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    final locale = LanguageManager().locale;
    List<Product> products = [];
    return BlocProvider(
      create: (context) => HomeCubit(locator()),
      child: Builder(builder: (context) {
        BlocProvider.of<HomeCubit>(context).fetchHomeScreenData(locale);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: SafeArea(
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) {
                  if (previous.dataStatus == current.dataStatus) {
                    return false;
                  }
                  return true;
                },
                builder: (context, state) {
                  if (state.dataStatus is HomeDataLoading) {
                    return LoadingScreen();
                  }

                  if (state.dataStatus is HomeDataError) {
                    final error = state.dataStatus as HomeDataError;
                    return CustomSnakbar.showSnackError(context, error.message);
                  }
                  if (state.dataStatus is HomeDataLoaded) {
                    if (state.dataStatus is HomeDataLoaded) {
                      final dataLoaded = state.dataStatus as HomeDataLoaded;
                      products = dataLoaded.data;
                    }
                  }

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
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              locale == 'de'
                                  ? Text(
                                      'Beliebte Produkte',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        color: isDarkMode
                                            ? AppColors.greyLight
                                            : AppColors.grey,
                                        fontSize: 20,
                                      ),
                                    )
                                  : Text(
                                      'Popular Products',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        color: isDarkMode
                                            ? AppColors.greyLight
                                            : AppColors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                              TextButton(
                                onPressed: () {},
                                child: locale == 'de'
                                    ? Text(
                                        'Mehr...',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          color: isDarkMode
                                              ? AppColors.accentDark
                                              : AppColors.accentLight,
                                          fontSize: 14,
                                        ),
                                      )
                                    : Text(
                                        'View All',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          color: isDarkMode
                                              ? AppColors.accentDark
                                              : AppColors.accentLight,
                                          fontSize: 14,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                return ProductCartScreen(
                                  product: products[index],
                                );
                              },
                            ),
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
      }),
    );
  }
}
