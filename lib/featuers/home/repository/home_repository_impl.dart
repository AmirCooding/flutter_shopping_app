import 'package:ustore/common/data_state.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/data/remote/api/store_api_service.dart';
import 'package:ustore/featuers/home/repository/home_reposiotry.dart';

class HomeRepositoryImpl extends HomeReposiotry {
  final StoreApiService apiService;

  HomeRepositoryImpl({required this.apiService});

  @override
  Future<List<Product>> getProducts() {
    return apiService.getProducts().then((value) {
      return value.data!;
    });
  }
}
