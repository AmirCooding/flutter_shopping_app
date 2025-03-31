import 'package:dio/dio.dart';
import 'package:ustore/common/data_state.dart';
import 'package:ustore/config/constants.dart';
import 'package:ustore/common/error_handling.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/locator.dart';

class StoreApiService {
  late Dio dio;
  StoreApiService() {
    dio = locator<Dio>();
  }
  Future<DataState<List<Product>>> getProducts() async {
    final response = await dio.get("$productsUrl/products");
    try {
      if (response.statusCode == 200) {
        final List<Product> products = [];
        final List<dynamic> data = response.data;
        for (var item in data) {
          products.add(Product.fromJson(item));
        }
        return DataSuccess(products);
      } else {
        return DataFailed(ErrorHandling.handleResponse(response.statusCode!));
      }
    } catch (e) {
      return DataFailed(ErrorHandling.handleResponse(response.statusCode!));
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      final response = await dio.get("$productsUrl/products/$id");
      return response.statusCode == 200
          ? Product.fromJson(response.data)
          : throw ErrorHandling.handleResponse(response.statusCode!);
    } catch (e) {
      throw ErrorHandling.PRODUCT_NOT_FOUND;
    }
  }

  Future<List<Product>> getProductByCategory(String category) async {
    try {
      final listOfProducts = getProducts();
      return listOfProducts.then((value) {
        return value.data!
            .where((element) => element.category == category)
            .toList();
      });
    } catch (e) {
      throw ErrorHandling.UNAVAILABLE_FOR_LEGAL_CATEGROY;
    }
  }
}
