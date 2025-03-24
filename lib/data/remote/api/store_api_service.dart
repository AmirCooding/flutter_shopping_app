import 'package:dio/dio.dart';
import 'package:ustore/common/constant/error_handling.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/locator.dart';

class StoreApiService {
  final productsUrl = "https://fakestoreapi.com";
  late Dio dio;
  StoreApiService() {
    dio = locator<Dio>();
  }

  Future<List<Product>> getProducts() async {
    final response = await dio.get("$productsUrl/products");
    if (response.statusCode == 200) {
      final List<Product> products = [];
      final List<dynamic> data = response.data;
      for (var item in data) {
        products.add(Product.fromJson(item));
      }
      return products;
    } else {
      throw ErrorHandling.handleResponse(response.statusCode!);
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
        return value.where((element) => element.category == category).toList();
      });
    } catch (e) {
      throw ErrorHandling.UNAVAILABLE_FOR_LEGAL_CATEGROY;
    }
  }
}
