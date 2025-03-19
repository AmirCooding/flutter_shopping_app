import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage firebaseStorage;
  StorageService({required this.firebaseStorage});

  Future<List<String>> fetchIntroImages(String folderName) async {
    ListResult result = await firebaseStorage.ref(folderName).listAll();
    List<String> imageUrls = [];

    for (var item in result.items) {
      String url = await item.getDownloadURL();
      imageUrls.add(url);
    }

    return imageUrls;
  }
}
