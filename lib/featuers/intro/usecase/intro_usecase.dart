import 'package:ustore/featuers/intro/repository/intro_data_repository.dart';

class IntroUsecase {
  final IntroDataRepository splashRepository;
  IntroUsecase({required this.splashRepository});

  Future<bool> checkConnectionEvent() {
    return splashRepository.checkConnectivity();
  }
}
