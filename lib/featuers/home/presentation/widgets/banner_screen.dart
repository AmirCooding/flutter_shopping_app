import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/custom_indecator.dart';
import 'package:ustore/common/display_dimensions.dart';
import 'package:ustore/featuers/home/presentation/bloc/home_cubit.dart';
import 'package:ustore/featuers/home/presentation/bloc/home_data_status.dart';
import 'package:ustore/utils/widgets/loading_screen.dart';

class BannerScreen extends StatelessWidget {
  const BannerScreen({
    super.key,
    required this.baners,
    required this.pageController,
    required this.pageViewLength,
  });
  final PageController pageController;
  final List<String?> baners;
  final int pageViewLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: screenWidth(context) * 0.9,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.dataStatus is HomeDataLoading) {
                return LoadingScreen();
              }
              return PageView.builder(
                itemCount: baners.length,
                controller: pageController,
                onPageChanged: (index) {
                  context.read<HomeCubit>().updateBanerIndex(index);
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(baners[index]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return CustomIndicator(
              dotHeight: 7,
              dotWidth: 7,
              spacing: 6,
              pageController: pageController,
              pageViewLength: baners.length,
            );
          },
        ),
      ],
    );
  }
}
