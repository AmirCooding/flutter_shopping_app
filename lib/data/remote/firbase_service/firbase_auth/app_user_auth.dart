import 'package:firebase_auth/firebase_auth.dart';
import 'package:ustore/common/error_handling.dart';
import 'package:ustore/data/models/app_user.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth firebaseAuth;
  late String? userId = " ";
  FirebaseAuthenticationService({required this.firebaseAuth});

  // Sign up with email and password, generating a custom UID
  Future<AppUser> signUpWithEmailAndPassword(AppUser appUser) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: appUser.email, password: appUser.password);

      setUserId(appUser.uid);
      User? currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        await currentUser.updateDisplayName(appUser.uid);
      }
      AppUser user = AppUser(
        email: appUser.email,
        password: appUser.password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      throw (ErrorHandling.handleAuthException(e));
    }
  }

  setUserId(String uid) {
    userId = uid;
  }

  String getUserId() {
    return userId!;
  }

  //Signin with Email and paasword
  Future<AppUser> signInWithEmailAndPassword(AppUser user) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      return AppUser(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      throw (ErrorHandling.handleAuthException(e));
    }
  }

  //Signout
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw (ErrorHandling.handleAuthException(e));
    }
  }

  Future<void> updatePassword(String email) async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        await user.updatePassword(email);
      }
    } on FirebaseAuthException catch (e) {
      throw (ErrorHandling.handleAuthException(e));
    }
  }
}
