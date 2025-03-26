import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ustore/utils/models/intro_localization.dart';
import 'package:ustore/utils/models/intro_page.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/intro_firebase_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_storage/storage_service.dart';
import 'package:ustore/featuers/intro/repository/intro_data_repository.dart';

class IntroDataRepositoryImpl implements IntroDataRepository {
  final IntroFirbaseService introFirbaseService;
  final StorageService introStorageService;
  IntroDataRepositoryImpl(this.introStorageService,
      {required this.introFirbaseService});
  @override
  Future<bool> checkConnectivity() async {
    // check if the device is connected to the internet
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }

    //////// check if the device is connected to the WIFI or mobile data/////////////////////////

    //   final connectivityResult = await (Connectivity().checkConnectivity());
    //   if (connectivityResult == ConnectivityResult.mobile) {
    //     return true;
    //   } else if (connectivityResult == ConnectivityResult.wifi) {
    //     return true;
    //   }
    //   return false;
  }

  @override
  Future<List<IntroPage>> getIntroLocalization(String locale) {
    return introFirbaseService.getIntroLocalization(locale).then((value) {
      if (value.isEmpty) {
        throw Exception('IntroLocalizationDe is empty or null');
      }
      return value;
    }).catchError((error) {
      debugPrint("Error fetching localization: $error");
      return [];
    });
  }

  @override
  Future<String?> fetchIntroImage(String path) {
    return introStorageService.fetchIntroImage(path).then((value) {
      if (value == null) {
        throw Exception('Image not found');
      }
      return value;
    }).catchError((error) {
      debugPrint("Error fetching image: $error");
      return null;
    });
  }
}
