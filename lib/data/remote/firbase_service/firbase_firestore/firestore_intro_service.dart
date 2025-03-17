import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ustore/common/utils/localization/intro_localization.dart';

class FirestoreIntroService {
  final FirebaseFirestore firestore;

  FirestoreIntroService({required this.firestore});
  // This function is used to get the intro localization in German
  Future<IntroLocalization?> getIntroLocalizationDe() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await firestore
              .collection('localization')
              .doc('localization_de')
              .collection('intro')
              .doc('intro_de')
              .get();
      return IntroLocalization.fromJson(documentSnapshot.data()!);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

// This function is used to get the intro localization in English
  Future<IntroLocalization?> getIntroLocalizationEn() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await firestore
              .collection('localization')
              .doc('localization_en')
              .collection('intro')
              .doc('intro_en')
              .get();
      return IntroLocalization.fromJson(documentSnapshot.data()!);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
