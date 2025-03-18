import 'package:flutter/material.dart';
import 'package:ustore/common/utils/models/intro_localization.dart';
import 'package:ustore/common/utils/models/intro_page.dart';
import 'package:ustore/featuers/intro/repository/intro_data_repository.dart';

class IntroUsecase {
  final IntroDataRepository introRepository;
  IntroUsecase({required this.introRepository});

  Future<bool> checkConnectionEvent() {
    return introRepository.checkConnectivity();
  }

  Future<List<IntroPage>> getIntroPages(String localeCode) async {
    try {
      // Fetch data from repositories
      final List<String> images = await introRepository.fetchIntroImages();
      final List<IntroLocalization> introLocalizationEn =
          await introRepository.getIntroLocalizationEn();
      final List<IntroLocalization> introLocalizationDe =
          await introRepository.getIntroLocalizationDe();

      // If any list is empty, return an empty list
      if (images.isEmpty) {
        throw Exception('No images found for intro pages');
      }
      if (localeCode == 'de' && introLocalizationDe.isEmpty) {
        throw Exception('No German localization found');
      }
      if (localeCode != 'de' && introLocalizationEn.isEmpty) {
        throw Exception('No English localization found');
      }

      final List<IntroPage> introPages = [];
      // Choose the correct localization list
      final List<IntroLocalization> selectedLocalization =
          (localeCode == 'de') ? introLocalizationDe : introLocalizationEn;
      // Combine images and localization
      for (int i = 0;
          i < images.length && i < selectedLocalization.length;
          i++) {
        introPages.add(IntroPage(
          image: images[i],
          introLocalization: selectedLocalization[i],
        ));
      }
      // Return the list of intro pages
      return introPages;
    } catch (e) {
      debugPrint("Error fetching intro pages: $e");
      // Return an empty list if there is an error
      return [];
    }
  }
}
