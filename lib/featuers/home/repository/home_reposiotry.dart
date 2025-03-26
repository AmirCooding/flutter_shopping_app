import 'package:ustore/common/data_state.dart';
import 'package:ustore/data/models/product.dart';

abstract class HomeReposiotry {
  Future<List<Product>> getProducts();
}
