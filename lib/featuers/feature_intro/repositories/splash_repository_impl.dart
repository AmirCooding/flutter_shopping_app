import 'dart:io';
import 'package:ustore/featuers/feature_intro/repositories/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  @override
  Future<bool> checkConnectivity() async {
    // check if the device is connected to the internet
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }

    //////// check if the device is connected to the WIFI or mobile data/////////////////////////

    //   final connectivityResult = await (Connectivity().checkConnectivity());
    //   if (connectivityResult == ConnectivityResult.mobile) {
    //     return true;
    //   } else if (connectivityResult == ConnectivityResult.wifi) {
    //     return true;
    //   }
    //   return false;
  }
}
