import 'package:firebase_auth/firebase_auth.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/data/remote/firbase_service/firbase_auth/app_user_auth.dart';
import 'package:ustore/featuers/details/repository/details_repositroy.dart';

class DetailsUsecase {
  final DetailsRepository detailsRepository;

  DetailsUsecase({required this.detailsRepository});

  Future<Product> getProductById(String id) async {
    return await detailsRepository.getProductById(id);
  }

  Future<void> addProductToFavorites(Product product, String userId) async {
    return await detailsRepository.addProductToFavorites(product, userId);
  }

  Future<void> removeProductFromFavorites(
      Product product, String userId) async {
    return await detailsRepository.removeProductFromFavorites(product, userId);
  }

  Future<bool> isProductInFavorites(String id) async {
    return await detailsRepository.isProductInFavorites(id);
  }

  Future<int> getFavoritesCount(String userId) async {
    return await detailsRepository.getFavoritesCount(userId);
  }

  Future<String> getCurrentUserId() async {
    return await detailsRepository.getCurrentUserId();
  }
}
