import 'package:ustore/data/models/product.dart';
import 'package:ustore/featuers/details/repository/details_repositroy.dart';

class DetailsUsecase {
  final DetailsRepository detailsRepository;
  DetailsUsecase({required this.detailsRepository});

  Future<Product> getProductById(String id) async {
    return await detailsRepository.getProductById(id);
  }
}
