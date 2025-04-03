import 'package:ustore/data/models/app_user.dart';
import 'package:ustore/data/models/profile.dart';

abstract class AuthRepository {
  Future<void> signInWithEmailAndPassword(AppUser user);
  Future<void> createProfile(Profile profie);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<void> updateProfile(Profile profile);
  Future<void> updatePassword(String password);

  //TODO: implement isUserLoggedIn
  // Future<bool> isUserLoggedIn();
}
