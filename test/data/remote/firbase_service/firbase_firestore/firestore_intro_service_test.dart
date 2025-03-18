import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ustore/common/utils/models/intro_localization.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/intro_firebase_service.dart';

import 'firestore_intro_service_test.mocks.dart';

@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot,
])
void main() {
  late MockFirebaseFirestore mockFirestore;
  late MockCollectionReference<Map<String, dynamic>> mockCollection;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentDe;
  late MockDocumentReference<Map<String, dynamic>> mockDocumentEn;
  late MockDocumentSnapshot<Map<String, dynamic>> mockDocumentSnapshotDe;
  late MockDocumentSnapshot<Map<String, dynamic>> mockDocumentSnapshotEn;
  late IntroFirbaseService firestoreIntroService;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockCollection = MockCollectionReference<Map<String, dynamic>>();
    mockDocumentDe = MockDocumentReference<Map<String, dynamic>>();
    mockDocumentEn = MockDocumentReference<Map<String, dynamic>>();
    mockDocumentSnapshotDe = MockDocumentSnapshot<Map<String, dynamic>>();
    mockDocumentSnapshotEn = MockDocumentSnapshot<Map<String, dynamic>>();

    firestoreIntroService = IntroFirbaseService(firestore: mockFirestore);

    // Mock Firestore behavior for English (DE)
    when(mockFirestore.collection('localization')).thenReturn(mockCollection);
    when(mockCollection.doc('localization_de')).thenReturn(mockDocumentDe);
    when(mockDocumentDe.collection('intro')).thenReturn(mockCollection);
    when(mockCollection.doc('intro_de')).thenReturn(mockDocumentDe);
    when(mockDocumentDe.get()).thenAnswer((_) async => mockDocumentSnapshotDe);
    when(mockDocumentSnapshotDe.exists).thenReturn(true);
    when(mockDocumentSnapshotDe.data()).thenReturn({
      'title1': 'Kleidung',
      'title2': 'Schmucks',
      'title3': 'Haus Geräte',
      'description1': 'Stilvolle Kleidung für jeden Anlass.',
      'description2': 'Elegante Schmuckstücke für Ihren Stil.',
      'description3': 'Hochwertige Haushaltsgeräte.',
    });

    // Mock Firestore behavior for English (EN)
    when(mockCollection.doc('localization_en')).thenReturn(mockDocumentEn);
    when(mockDocumentEn.collection('intro')).thenReturn(mockCollection);
    when(mockCollection.doc('intro_en')).thenReturn(mockDocumentEn);
    when(mockDocumentEn.get()).thenAnswer((_) async => mockDocumentSnapshotEn);
    when(mockDocumentSnapshotEn.exists).thenReturn(true);
    when(mockDocumentSnapshotEn.data()).thenReturn({
      'title1': 'Clothing',
      'title2': 'Jewelry',
      'title3': 'Home Appliances',
      'description1': 'Stylish clothing for every occasion.',
      'description2': 'Elegant jewelry pieces to elevate your style.',
      'description3': 'High-quality household appliances.',
    });
  });

  test('getIntroLocalizationDe should return a valid IntroLocalization object',
      () async {
    final result = await firestoreIntroService.getIntroLocalizationDe();

    expect(result, isNotNull);
    expect(result, isA<IntroLocalization>());
    expect(result!.title1, equals('Kleidung'));
    expect(result.title2, equals('Schmucks'));
    expect(result.title3, equals('Haus Geräte'));
    expect(result.description1, equals('Stilvolle Kleidung für jeden Anlass.'));
    expect(
        result.description2, equals('Elegante Schmuckstücke für Ihren Stil.'));
    expect(result.description3, equals('Hochwertige Haushaltsgeräte.'));
  });

  test('getIntroLocalizationEn should return a valid IntroLocalization object',
      () async {
    final result = await firestoreIntroService.getIntroLocalizationEn();

    expect(result, isNotNull);
    expect(result, isA<IntroLocalization>());
    expect(result!.title1, equals('Clothing'));
    expect(result.title2, equals('Jewelry'));
    expect(result.title3, equals('Home Appliances'));
    expect(result.description1, 'Stylish clothing for every occasion.');
    expect(
        result.description2, 'Elegant jewelry pieces to elevate your style.');
    expect(result.description3, 'High-quality household appliances.');
  });
}
