import 'package:ustore/featuers/main_wrapper/repository/main_wrapper_repository.dart';

class MainWrpperUsecase {
  final MainWrapperRepository mainWrapperRepository;

  MainWrpperUsecase(this.mainWrapperRepository);
  Future<int> getFavoritescount() async {
    final favorites = await mainWrapperRepository.getFavoritescount();
    return favorites.length;
  }
}
