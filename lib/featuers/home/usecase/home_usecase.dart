import 'package:ustore/common/data_state.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/featuers/home/repository/home_reposiotry.dart';

class HomeUsecase {
  final HomeReposiotry _homeRepository;

  HomeUsecase(this._homeRepository);

  Future<List<Product>> getHomeData() async {
    return await _homeRepository.getProducts();
  }
}
