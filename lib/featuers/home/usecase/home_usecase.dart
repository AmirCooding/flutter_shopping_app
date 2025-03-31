import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/featuers/home/repository/home_reposiotry.dart';

class HomeUsecase {
  final HomeReposiotry _homeRepository;
  Timer? _bannerTimer;
  HomeUsecase(this._homeRepository);

  Future<List<Product>> getHomeData() async {
    return await _homeRepository.getProducts();
  }

  Future<List<String?>> fetchBanerImages() async {
    return await _homeRepository.fetchBanerImages();
  }

  void startAutoSlide(int length, Function(int) onIndexChange) {
    if (length <= 0) return;
    _bannerTimer?.cancel();
    int currentIndex = 0;
    _bannerTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      currentIndex = (currentIndex + 1) % length;
      debugPrint("Neuer Banner-Index: $currentIndex"); // Debugging
      onIndexChange(currentIndex);
    });

    debugPrint("AutoSlide gestartet mit $length Bannern."); // Debugging
  }

  void stopAutoSlide() {
    _bannerTimer?.cancel();
  }
}
