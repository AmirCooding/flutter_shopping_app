import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ustore/common/utils/models/intro_localization.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/intro_firebase_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_storage/intro_storage_service.dart';
import 'package:ustore/featuers/intro/repository/intro_data_repository.dart';

class IntroDataRepositoryImpl implements IntroDataRepository {
  final IntroFirbaseService introFirbaseService;
  final IntroStorageService introStorageService;
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
  Future<List<IntroLocalization>> getIntroLocalizationDe() {
    return introFirbaseService.getIntroLocalizationDe().then((value) {
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
  Future<List<IntroLocalization>> getIntroLocalizationEn() {
    return introFirbaseService.getIntroLocalizationEn().then((value) {
      if (value.isEmpty) {
        throw Exception('IntroLocalizationEn is empty or null');
      }
      return value;
    }).catchError((error) {
      debugPrint("Error fetching localization: $error");
      return [];
    });
  }

  @override
  Future<List<String>> fetchIntroImages() {
    return introStorageService.fetchIntroImages().then((value) {
      if (value.isEmpty) {
        throw Exception('IntroImages is empty');
      }
      return value;
    });
  }
}
