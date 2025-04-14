import 'package:ustore/data/models/product.dart';
import 'package:ustore/data/remote/api/store_api_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_auth/app_user_auth.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/firestore_firebase_service.dart';
import 'package:ustore/featuers/details/repository/details_repositroy.dart';

class DetailsReposiotryImpl extends DetailsRepository {
  final StoreApiService storeApiService;
  final FirebaseFireSotreService firebaseFireSotreService;
  final FirebaseAuthenticationService firebaseAuthenticationService;
  DetailsReposiotryImpl(
      {required this.firebaseAuthenticationService,
      required this.firebaseFireSotreService,
      required this.storeApiService});
  @override
  Future<Product> getProductById(String id) async {
    return await storeApiService.getProductById(id);
  }

  @override
  Future<void> addProductToFavorites(Product product, String userId) {
    return firebaseFireSotreService.addProductToFavorites(product, userId);
  }

  @override
  Future<void> removeProductFromFavorites(Product product, String userId) {
    return firebaseFireSotreService.removeProductFromFavorite(product, userId);
  }

  @override
  Future<bool> isProductInFavorites(String id) {
    return firebaseFireSotreService.isProductInFavorites(id);
  }

  @override
  Future<int> getFavoritesCount(String userId) {
    return firebaseFireSotreService.getFavoritesCount(userId);
  }

  @override
  Future<String> getCurrentUserId() {
    return firebaseAuthenticationService.getCurrentUserId();
  }
}
