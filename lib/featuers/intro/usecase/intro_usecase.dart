import 'package:flutter/material.dart';
import 'package:ustore/common/language_manager.dart';

import 'package:ustore/utils/models/intro_page.dart';
import 'package:ustore/featuers/intro/repository/intro_data_repository.dart';
import 'package:ustore/gen/assets.gen.dart';

class IntroUsecase {
  final IntroDataRepository introRepository;
  IntroUsecase({required this.introRepository});

  Future<bool> checkConnectionEvent() {
    return introRepository.checkConnectivity();
  }

  Future<List<IntroPage>> getIntroPages() async {
    final String localeCode = LanguageManager().locale;
    List<IntroPage> introLocalization = [];
    List<IntroPage> intropages = [];

    try {
      introLocalization = await introRepository
          .getIntroLocalization(localeCode)
          .catchError((e) {
        debugPrint("⚠️ Fehler beim Laden der Intro-Texte: $e");
        return <IntroPage>[]; // ✅ Stelle sicher, dass eine Liste zurückgegeben wird!
      });

      if (introLocalization.isEmpty) {
        debugPrint("⚠️ Keine Intro-Daten gefunden für Sprache: $localeCode");
        return [];
      }

      intropages = await Future.wait(introLocalization.map((intro) async {
        final imageUrl = await introRepository
                .fetchIntroImage(intro.image ?? '')
                .catchError((e) {
              debugPrint(
                  "⚠️ Fehler beim Laden des Bildes: ${intro.image} → $e");
              return Assets.images.logo.path; // ✅ Standardbild setzen!
            }) ??
            Assets.images.logo.path;

        return IntroPage(
          image: imageUrl,
          introLocalization: intro.introLocalization,
        );
      }));

      debugPrint('✅ Final introPages length: ${intropages.length}');
      return intropages;
    } catch (e, stacktrace) {
      debugPrint("❌ Fehler beim Abrufen der Intro-Seiten: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
      return [];
    }
  }
}
