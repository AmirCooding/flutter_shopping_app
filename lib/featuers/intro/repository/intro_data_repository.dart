import 'package:ustore/common/utils/models/intro_localization.dart';

abstract class IntroDataRepository {
  Future<bool> checkConnectivity();
  Future<List<IntroLocalization>> getIntroLocalizationEn();
  Future<List<IntroLocalization>> getIntroLocalizationDe();
  Future<List<String>> fetchIntroImages();
}
