import 'package:ustore/data/models/product.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/firestore_firebase_service.dart';
import 'package:ustore/featuers/main_wrapper/repository/main_wrapper_repository.dart';

class MainWrapperRepositoryImpl extends MainWrapperRepository {
  final FirebaseFireSotreService firestoreFirebaseService;

  MainWrapperRepositoryImpl({required this.firestoreFirebaseService});
  @override
  Future<List<Product>> getFavoritescount() async {
    return firestoreFirebaseService.getFavoriteProducts();
  }
}
