import 'package:ustore/data/models/product.dart';

abstract class HomeReposiotry {
  Future<List<Product>> getProducts();
  Future<List<Product>> getProductsInDe();
  Future<List<String?>> fetchBanerImages();
  Future<void> addProductToFavorite(Product product, String userId);
  Future<int> getFavoritesCount(String userId);

  Future<void> removeProductFromFavorite(Product product, String userId);
}
