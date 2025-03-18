import 'package:firebase_storage/firebase_storage.dart';

class IntroStorageService {
  final FirebaseStorage firebaseStorage;
  IntroStorageService({required this.firebaseStorage});

  Future<List<String>> fetchIntroImages() async {
    ListResult result = await firebaseStorage.ref('intro').listAll();
    List<String> imageUrls = [];

    for (var item in result.items) {
      String url = await item.getDownloadURL();
      imageUrls.add(url);
    }

    return imageUrls;
  }
}
