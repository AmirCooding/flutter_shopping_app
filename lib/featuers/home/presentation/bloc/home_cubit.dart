import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ustore/featuers/home/presentation/bloc/home_data_status.dart';
import 'package:ustore/featuers/home/usecase/home_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUsecase homeUsecase;
  final PageController pageController = PageController();

  HomeCubit(this.homeUsecase) : super(HomeState(dataStatus: HomeDataLoading()));

  void fetchAPopularProducts(String locale) {
    // emit(state.copyWith(newDataStatus: HomeDataLoading()));
    homeUsecase.fetchProducts(locale).then((products) {
      emit(state.copyWith(
        newDataStatus: HomeDataLoaded(data: products),
      ));
    }).catchError((e) {
      emit(state.copyWith(newDataStatus: HomeDataError(message: e.toString())));
    });
  }

  void callBanerImages() {
    //emit(state.copyWith(newDataStatus: HomeDataLoading()));
    homeUsecase.fetchBanerImages().then((banners) {
      emit(state.copyWith(
        newDataStatus: HomeDataBanerImagesLoaded(),
        newBannerImages: banners,
      ));

      startBannerAutoSlide(banners.length);
    }).catchError((e) {
      emit(state.copyWith(newDataStatus: HomeDataError(message: e.toString())));
    });
  }

  void fetchHomeScreenData(String locale) {
    emit(state.copyWith(newDataStatus: HomeDataLoading()));
    callBanerImages();
    fetchAPopularProducts(locale);
  }

  void startBannerAutoSlide(int length) {
    homeUsecase.startAutoSlide(length, (index) {
      if (index >= length) {
        pageController.jumpToPage(0);
        index = 0;
      }
      updateBanerIndex(index);
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void updateBanerIndex(int index) {
    emit(state.copyWith(newBanerIndex: index));
  }

  void stopAutoSlide() {
    homeUsecase.stopAutoSlide();
  }

  @override
  Future<void> close() async {
    stopAutoSlide();
    pageController.dispose();
    return super.close();
  }
}
