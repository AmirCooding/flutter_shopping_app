import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

// This function is used to setup Firebase for testing
// It is used in the test files that require Firebase
Future<void> setupFirebaseMocks() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint("Firebase already initialized: $e");
  }
}
