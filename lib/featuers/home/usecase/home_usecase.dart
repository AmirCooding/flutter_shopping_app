import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/featuers/home/repository/home_reposiotry.dart';

class HomeUsecase {
  final HomeReposiotry _homeRepository;
  Timer? _bannerTimer;
  HomeUsecase(this._homeRepository);
  Future<List<Product>> fetchProducts(String locale) async {
    List<Product> products;
    List<Product> popularProducts = [];
    if (locale == 'de') {
      products = await _homeRepository.getProductsInDe();
    } else {
      products = await _homeRepository.getProducts();
    }
    products.sort((a, b) => b.rating!.count!.compareTo(a.rating!.count!));
    for (var product in products) {
      debugPrint('Product: ${product.rating!.count}');
    }
    for (int i = 0; i < 6; i++) {
      popularProducts.add(products[i]);
    }
    return popularProducts;
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
      onIndexChange(currentIndex);
    });
  }

  void stopAutoSlide() {
    _bannerTimer?.cancel();
  }
}
