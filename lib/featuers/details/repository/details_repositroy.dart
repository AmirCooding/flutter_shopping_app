import 'package:ustore/data/models/product.dart';

abstract class DetailsRepository {
  Future<Product> getProductById(String id);
  Future<void> addProductToFavorites(Product product, String userId);
  Future<void> removeProductFromFavorites(Product product, String userId);
  Future<bool> isProductInFavorites(String id);
  Future<int> getFavoritesCount(String userId);
  Future<String> getCurrentUserId();
}
