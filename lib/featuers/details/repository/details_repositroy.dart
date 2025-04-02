import 'package:ustore/data/models/product.dart';

abstract class DetailsRepository {
  Future<Product> getProductById(String id);
}
