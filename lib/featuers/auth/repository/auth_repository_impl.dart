import 'package:ustore/data/models/app_user.dart';
import 'package:ustore/data/models/profile.dart';
import 'package:ustore/data/remote/firbase_service/firbase_auth/app_user_auth.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/firestore_firebase_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_storage/firebase_storage_service.dart';
import 'package:ustore/featuers/auth/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final FirebaseAuthenticationService appUserAuth;
  final FirbaseStorageService storageService;
  final FirebaseFireSotreService firestoreService;
  AuthRepositoryImpl({
    required this.appUserAuth,
    required this.storageService,
    required this.firestoreService,
  });

  @override
  Future<void> resetPassword(String email) async {
    await appUserAuth.resetPassword(email);
  }

  @override
  Future<void> signInWithEmailAndPassword(AppUser user) async {
    await appUserAuth.signInWithEmailAndPassword(user.email, user.password);
  }

  @override
  Future<void> signOut() async {
    await appUserAuth.signOut();
  }

  @override
  Future<void> updatePassword(String password) async {
    await appUserAuth.updatePassword(password);
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    await firestoreService.updateProfile(profile);
  }

  @override
  Future<void> createProfile(Profile profie) async {
    await firestoreService.createProfile(profie);
  }
}
