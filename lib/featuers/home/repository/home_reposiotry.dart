import 'package:ustore/data/models/product.dart';

abstract class HomeReposiotry {
  Future<List<Product>> getProducts();
  Future<List<String?>> fetchBanerImages();
}
