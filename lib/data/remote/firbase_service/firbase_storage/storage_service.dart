import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageService {
  final FirebaseStorage firebaseStorage;
  StorageService({required this.firebaseStorage});

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
}
