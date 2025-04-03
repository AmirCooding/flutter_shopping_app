import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class FirbaseStorageService {
  final FirebaseStorage firebaseStorage;
  FirbaseStorageService({required this.firebaseStorage});

  Future<String?> fetchIntroImage(String imageName) async {
    try {
      final ref = firebaseStorage.ref('intro/$imageName');
      String url = await ref.getDownloadURL();
      debugPrint("Image found: $imageName → $url");
      return url;
    } catch (e) {
      debugPrint(" Error fetching image '$imageName': $e");
      return null;
    }
  }

  Future<List<String?>> fetchBanerImages() async {
    try {
      final ref = firebaseStorage.ref('baner');
      ListResult result = await ref.listAll();
      List<String?> urls = [];

      for (var item in result.items) {
        String url = await item.getDownloadURL();
        urls.add(url);
      }
      return urls;
    } catch (e) {
      return [];
    }
  }

  Future<String> uploadImageToProfile(String uid, String imagePath) async {
    try {
      String fileExtension = path.extension(imagePath);
      final ref =
          FirebaseStorage.instance.ref().child("profile/$uid$fileExtension");
      final imageFile = File(imagePath);
      await ref.putFile(imageFile);
      String imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      debugPrint("❌ Error uploading images:: $e");
      throw Exception("Error uploading images:");
    }
  }

  Future<String?> fetchImageProfile(String imageName) async {
    try {
      final ref = firebaseStorage.ref('profile/$imageName');
      String url = await ref.getDownloadURL();
      debugPrint("Image found: $imageName → $url");
      return url;
    } catch (e) {
      debugPrint(" Error fetching image '$imageName': $e");
      return null;
    }
  }

  Future<String?> updateProfileImage(String uid, String imagePath) async {
    try {
      String fileExtension = path.extension(imagePath);
      final ref =
          FirebaseStorage.instance.ref().child("profile/$uid$fileExtension");
      final imageFile = File(imagePath);
      await ref.putFile(imageFile);
      String imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      debugPrint("❌ Error uploading images: $e");
      throw Exception("Error uploading images:");
    }
  }

  Future<void> deleteImageProfile(String uid) async {
    try {
      final ref = FirebaseStorage.instance.ref().child("profile/$uid");
      await ref.delete();
    } on FirebaseException catch (e) {
      debugPrint("❌ Error deleting images: $e");
      throw Exception("Error deleting images:");
    }
  }
}
