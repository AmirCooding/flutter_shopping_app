import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/data/models/profile.dart';
import 'package:ustore/data/remote/firbase_service/firbase_auth/app_user_auth.dart';
import 'package:ustore/data/remote/firbase_service/firbase_storage/firebase_storage_service.dart';
import 'package:ustore/utils/models/intro_page.dart';

class FirebaseFireSotreService {
  final FirebaseFirestore firestore;
  final FirebaseAuthenticationService appUserAuth;
  final FirbaseStorageService storageService;
  FirebaseFireSotreService(
      {required this.storageService,
      required this.appUserAuth,
      required this.firestore});

  // create a profile in firestore
  Future<void> createProfile(Profile profile) async {
    try {
      await appUserAuth.signUpWithEmailAndPassword(
          profile.user.email, profile.user.password);
      final profileData = {
        'uid': profile.uid,
        'fullName': profile.fullName,
        'user': profile.user.toJson(),
        'phone': profile.phone,
        'image': profile.image,
        'address': profile.address?.toJson(),
        'paymentMethod': profile.paymentMethod?.toJson(),
      };
      storageService
          .uploadImageToProfile(profile.uid, profile.image ?? "No image")
          .then((imageUrl) {
        profileData['image'] = imageUrl;
      });
      await firestore
          .collection('account')
          .doc(appUserAuth.getUserId().trim())
          .set(profileData);
      debugPrint("✅ Profile created successfully");
    } catch (e, stacktrace) {
      debugPrint("❌ Error creating profile: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
    }
  }

// Update profile in firestore
  Future<void> updateProfile(Profile profile) async {
    try {
      final profileData = {
        'uid': profile.uid,
        'fullName': profile.fullName,
        'user': profile.user.toJson(),
        'phone': profile.phone,
        'image': profile.image,
        'address': profile.address?.toJson(),
        'paymentMethod': profile.paymentMethod?.toJson(),
      };
      await firestore
          .collection('account')
          .doc(appUserAuth.getUserId())
          .update(profileData);
      debugPrint("✅ Profile updated successfully");
    } catch (e, stacktrace) {
      debugPrint("❌ Error updating profile: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
    }
  }

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
