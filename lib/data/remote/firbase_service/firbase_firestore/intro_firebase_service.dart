import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ustore/common/utils/models/intro_localization.dart';

class IntroFirbaseService {
  final FirebaseFirestore firestore;

  IntroFirbaseService({required this.firestore});

  Future<List<IntroLocalization>> getIntroLocalizationDe() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('localization')
          .doc('localization_de')
          .collection('intro')
          .get();
      if (querySnapshot.docs.isEmpty) {
        debugPrint('No data found from get Intro localization DE ');
        return [];
      }
      return querySnapshot.docs
          .map((doc) => IntroLocalization.fromJson(doc.data()))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

// This function is used to get the intro localization in English

  Future<List<IntroLocalization>> getIntroLocalizationEn() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('localization')
          .doc('localization_en')
          .collection('intro')
          .get();
      if (querySnapshot.docs.isEmpty) {
        debugPrint('No data found from get Intro localization En ');
        return [];
      }
      return querySnapshot.docs
          .map((doc) => IntroLocalization.fromJson(doc.data()))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
