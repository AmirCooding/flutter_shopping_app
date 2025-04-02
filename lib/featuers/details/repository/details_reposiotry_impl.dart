import 'package:ustore/data/models/product.dart';
import 'package:ustore/data/remote/api/store_api_service.dart';
import 'package:ustore/featuers/details/repository/details_repositroy.dart';

class DetailsReposiotryImpl extends DetailsRepository {
  final StoreApiService storeApiService;
  DetailsReposiotryImpl({required this.storeApiService});
  @override
  Future<Product> getProductById(String id) async {
    return await storeApiService.getProductById(id);
  }
}
