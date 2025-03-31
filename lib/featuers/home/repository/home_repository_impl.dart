import 'package:firebase_storage/firebase_storage.dart';
import 'package:ustore/common/data_state.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/data/remote/api/store_api_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_storage/storage_service.dart';
import 'package:ustore/featuers/home/repository/home_reposiotry.dart';

class HomeRepositoryImpl extends HomeReposiotry {
  final StoreApiService apiService;
  final StorageService storageService;

  HomeRepositoryImpl(this.storageService, this.apiService);

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
}
