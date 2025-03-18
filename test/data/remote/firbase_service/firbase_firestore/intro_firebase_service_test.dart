import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ustore/common/utils/models/intro_localization.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/intro_firebase_service.dart';

import 'intro_firebase_service_test.mocks.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  QuerySnapshot,
  QueryDocumentSnapshot,
])
void main() {
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollection;
  late MockDocumentReference<Map<String, dynamic>> mockDocument;
  late MockQuerySnapshot<Map<String, dynamic>> mockQuerySnapshot;
  late MockQueryDocumentSnapshot<Map<String, dynamic>> mockDocSnapshot;
  late IntroFirbaseService introFirebaseService;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollection = MockCollectionReference<Map<String, dynamic>>();
    mockDocument = MockDocumentReference<Map<String, dynamic>>();
    mockQuerySnapshot = MockQuerySnapshot<Map<String, dynamic>>();
    mockDocSnapshot = MockQueryDocumentSnapshot<Map<String, dynamic>>();
    introFirebaseService = IntroFirbaseService(firestore: mockFirestore);
  });

  group('getIntroLocalizationDe', () {
    test('returns a list of IntroLocalization when data is available',
        () async {
      final data = {
        'title': 'Willkommen',
        'description': 'Dies ist eine Einführung'
      };

      when(mockFirestore.collection(any)).thenReturn(mockCollection);
      when(mockCollection.doc(any))
          .thenReturn(mockDocument as DocumentReference<Map<String, dynamic>>);
      when(mockDocument.collection(any)).thenReturn(mockCollection);
      when(mockCollection.get()).thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([mockDocSnapshot]);
      when(mockDocSnapshot.data()).thenReturn(data);

      final result = await introFirebaseService.getIntroLocalizationDe();

      expect(result, isA<List<IntroLocalization>>());
      expect(result.length, 1);
      expect(result.first.title, 'Willkommen');
      expect(result.first.description, 'Dies ist eine Einführung');
    });

    test('returns an empty list when no data is found', () async {
      when(mockFirestore.collection(any)).thenReturn(mockCollection);
      when(mockCollection.doc(any))
          .thenReturn(mockDocument as DocumentReference<Map<String, dynamic>>);
      when(mockDocument.collection(any)).thenReturn(mockCollection);
      when(mockCollection.get()).thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([]);

      final result = await introFirebaseService.getIntroLocalizationDe();

      expect(result, isEmpty);
    });
  });
}
