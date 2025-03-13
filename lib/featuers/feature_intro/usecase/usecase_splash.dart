import 'package:ustore/featuers/feature_intro/repositories/splash_repository.dart';

class UsecaseSplash {
  final SplashRepository splashRepository;
  UsecaseSplash({required this.splashRepository});

  Future<bool> checkConnectionEvent() {
    return splashRepository.checkConnectivity();
  }
}
