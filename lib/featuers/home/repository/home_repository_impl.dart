import 'package:firebase_storage/firebase_storage.dart';
import 'package:ustore/common/data_state.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/data/remote/api/store_api_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/fire_store_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_storage/storage_service.dart';
import 'package:ustore/featuers/home/repository/home_reposiotry.dart';

class HomeRepositoryImpl extends HomeReposiotry {
  final StoreApiService apiService;
  final StorageService storageService;
  final FireSotreService firstore;

  HomeRepositoryImpl(
      {required this.firstore,
      required this.apiService,
      required this.storageService});

  @override
  Future<List<Product>> getProducts() {
    return apiService.getProducts().then((value) {
      return value.data!;
    });
  }

  @override
  Future<List<String?>> fetchBanerImages() {
    return storageService.fetchBanerImages();
  }

  @override
  Future<List<Product>> getProductsInDe() {
    return firstore.getProductsInDe();
  }
}
