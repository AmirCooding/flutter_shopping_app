import 'package:ustore/data/models/product.dart';

abstract class MainWrapperRepository {
  Future<List<Product>> getFavoritescount();
}
