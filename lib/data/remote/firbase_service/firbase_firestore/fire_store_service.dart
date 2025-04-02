import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/utils/models/intro_page.dart';

class FireSotreService {
  final FirebaseFirestore firestore;
  FireSotreService({required this.firestore});

  // Fetches the intro localization from Firestore
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

  //Fetch all Product from firstore in De language
  Future<List<Product>> getProductsInDe() async {
    try {
      final querySnapshot = await firestore.collection('products').get();
      if (querySnapshot.docs.isEmpty) {
        debugPrint("⚠️ No products found");
        return [];
      }
      final productList = querySnapshot.docs
          .map((doc) => Product.fromJson(doc.data()))
          .toList();

      debugPrint("✅ Found ${productList.length} products in Germany");
      return productList;
    } catch (e, stacktrace) {
      debugPrint("❌ Error fetching products: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
      return [];
    }
  }
}
