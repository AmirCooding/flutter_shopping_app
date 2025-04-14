import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/data/models/profile.dart';
import 'package:ustore/data/remote/api/store_api_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_auth/app_user_auth.dart';
import 'package:ustore/data/remote/firbase_service/firbase_storage/firebase_storage_service.dart';
import 'package:ustore/utils/models/intro_page.dart';

class FirebaseFireSotreService {
  final FirebaseFirestore firestore;
  final FirebaseAuthenticationService appUserAuth;
  final FirbaseStorageService storageService;
  final StoreApiService apiService;
  FirebaseFireSotreService({
    required this.apiService,
    required this.firestore,
    required this.appUserAuth,
    required this.storageService,
  });

  // create a profile in firestore
  Future<void> signUp(Profile profile) async {
    try {
      await appUserAuth.signUpWithEmailAndPassword(profile.user);
      final imageUrl = await storageService.uploadImageToProfile(
        profile.uid,
        profile.image ?? "No image",
      );
      final profileData = {
        'uid': profile.uid,
        'fullName': profile.fullName,
        'user': profile.user.toJson(),
        'phone': profile.phone,
        'image': imageUrl,
        'address': profile.address?.toJson(),
        'paymentMethod': profile.paymentMethod?.toJson(),
      };
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
    } on FirebaseException catch (e, stacktrace) {
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

// Fetch all Product from firstore in De language
  Future<Product> getProductByIdDe(String id) async {
    try {
      final docSnapshot = await firestore.collection('products').doc(id).get();
      if (!docSnapshot.exists) {
        throw Exception("Product not found");
      }
      return Product.fromJson(docSnapshot.data()!);
    } catch (e, stacktrace) {
      debugPrint("❌ Error fetching product by ID: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
      rethrow;
    }
  }

  Future<void> addProductToFavorites(Product product, String userId) async {
    try {
      final docRef = firestore
          .collection('favorite')
          .doc(userId)
          .collection('products')
          .doc(product.id.toString());
      await docRef.set({'id': product.id});
      debugPrint("✅ Product ID added to user's favorites.");
    } catch (e, stacktrace) {
      debugPrint("❌ Error adding product to favorites: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
      rethrow;
    }
  }

  Future<void> removeProductFromFavorite(Product product, String userId) async {
    try {
      final docRef = firestore
          .collection('favorite')
          .doc(userId)
          .collection('products')
          .doc(product.id.toString());

      await docRef.delete();
      debugPrint("✅ Product removed from favorites");
    } catch (e, stacktrace) {
      debugPrint("❌ Error removing product from favorites: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
    }
  }

  Future<bool> isProductInFavorites(String productId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("User not logged in.");

      final docRef = firestore
          .collection('favorite')
          .doc(user.uid)
          .collection('products')
          .doc(productId);
      final docSnapshot = await docRef.get();
      return docSnapshot.exists;
    } catch (e, stacktrace) {
      debugPrint("❌ Error checking if product is in favorites: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
      return false;
    }
  }

  Future<int> getFavoritesCount(String userId) async {
    final snapshot = await firestore
        .collection('favorite')
        .doc(userId)
        .collection('products')
        .get();
    return snapshot.docs.length;
  }

  Future<List<Product>> getFavoriteProducts() async {
    final langCode = LanguageManager().locale;
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception("User not logged in.");

      final favoritesSnapshot = await firestore
          .collection('favorite')
          .doc(user.uid)
          .collection('products')
          .get();

      if (favoritesSnapshot.docs.isEmpty) {
        debugPrint("⚠️ No favorite products found");
        return [];
      }

      final favoriteIds = favoritesSnapshot.docs.map((doc) => doc.id).toList();

      final productFutures = favoriteIds.map((productId) async {
        try {
          if (langCode == 'de') {
            return await getProductByIdDe(productId);
          } else {
            return await apiService.getProductById(productId);
          }
        } catch (e) {
          debugPrint("❌ Failed to load product $productId: $e");
          return null;
        }
      });

      final productList =
          (await Future.wait(productFutures)).whereType<Product>().toList();

      debugPrint(
          "✅ Found ${productList.length} favorite products for language '$langCode'");
      return productList;
    } catch (e, stacktrace) {
      debugPrint("❌ Error fetching favorite products: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
      return [];
    }
  }

  Future<Product> addProductInCart(Product product) async {
    try {
      final docRef = firestore.collection('cart').doc(product.id.toString());
      await docRef.set(product.toJson());
      debugPrint("✅ Product added to cart");
      return product;
    } catch (e, stacktrace) {
      debugPrint("❌ Error adding product to cart: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
      rethrow;
    }
  }

  Future<void> removeProductFromCart(Product product) async {
    try {
      final docRef = firestore.collection('cart').doc(product.id.toString());
      await docRef.delete();
      debugPrint("✅ Product removed from cart");
    } catch (e, stacktrace) {
      debugPrint("❌ Error removing product from cart: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
    }
  }

  Future<List<Product>> getCartProducts() async {
    try {
      final querySnapshot = await firestore.collection('cart').get();
      if (querySnapshot.docs.isEmpty) {
        debugPrint("⚠️ No cart products found");
        return [];
      }
      final productList = querySnapshot.docs
          .map((doc) => Product.fromJson(doc.data()))
          .toList();

      debugPrint("✅ Found ${productList.length} cart products");
      return productList;
    } catch (e, stacktrace) {
      debugPrint("❌ Error fetching cart products: $e");
      debugPrint("🔍 Stacktrace: $stacktrace");
      return [];
    }
  }
}
