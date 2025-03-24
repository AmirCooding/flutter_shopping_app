import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ustore/common/utils/models/intro_page.dart';
import 'package:ustore/data/remote/api/store_api_service.dart';

class IntroFirbaseService {
  final FirebaseFirestore firestore;
  IntroFirbaseService({required this.firestore});
  Future<List<IntroPage>> getIntroLocalization(String locale) async {
    try {
      final docSnapshot = await firestore
          .collection('localization')
          .doc('localization_$locale')
          .get();
      if (!docSnapshot.exists) {
        return [];
      }
      final data = docSnapshot.data();
      if (data == null || data['intro'] == null) {
        debugPrint("⚠️ No 'intro' field found in localization_$locale");
        return [];
      }
      final List<dynamic> introList = data['intro'];
      return introList
          .whereType<Map<String, dynamic>>()
          .map((intro) => IntroPage.fromJson(intro))
          .toList();
    } catch (e, stacktrace) {
      debugPrint("❌ Error fetching intro localization ($locale): $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
      return [];
    }
  }
}
