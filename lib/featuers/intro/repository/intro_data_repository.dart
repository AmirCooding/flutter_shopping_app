import 'package:ustore/utils/models/intro_page.dart';

abstract class IntroDataRepository {
  Future<bool> checkConnectivity();
  Future<List<IntroPage>> getIntroLocalization(String locale);
  Future<String?> fetchIntroImage(String path);
}
