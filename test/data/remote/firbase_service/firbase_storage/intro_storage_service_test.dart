import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ustore/data/remote/firbase_service/firbase_storage/intro_storage_service.dart';

import 'intro_storage_service_test.mocks.dart';

@GenerateMocks([FirebaseStorage, Reference, ListResult])
void main() {
  group('IntroStorageService', () {
    late IntroStorageService introStorageService;
    late MockFirebaseStorage mockFirebaseStorage;
    late MockReference mockReference;
    late MockListResult mockListResult;

    setUp(() {
      mockFirebaseStorage = MockFirebaseStorage();
      mockReference = MockReference();
      mockListResult = MockListResult();
      introStorageService =
          IntroStorageService(firebaseStorage: mockFirebaseStorage);
    });

    test('should return list of image urls', () async {
      // arrange
      when(mockFirebaseStorage.ref('intro')).thenReturn(mockReference);
      when(mockReference.listAll()).thenAnswer((_) async => mockListResult);
      when(mockListResult.items).thenReturn([mockReference]);
      when(mockReference.getDownloadURL()).thenAnswer((_) async => 'url');
      // act
      final result = await introStorageService.fetchIntroImages();
      // assert
      expect(result, ['url']);
    });
  });
}
