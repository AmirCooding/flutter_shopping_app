import 'package:firebase_auth/firebase_auth.dart';
import 'package:ustore/common/error_handling.dart';
import 'package:ustore/data/models/app_user.dart';
import 'package:uuid/uuid.dart';

class AppUserAuth {
  final FirebaseAuth firebaseAuth;
  final Uuid uuid = const Uuid();
  AppUserAuth({required this.firebaseAuth});

  // Sign up with email and password, generating a custom UID
  Future<AppUser> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      String customUid = uuid.v4();
      AppUser user = AppUser(
        uid: customUid,
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      throw (ErrorHandling.handleAuthException(e));
    }
  }

  //Signin with Email and paasword
  Future<AppUser> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return AppUser(
        uid: userCredential.user!.uid,
        email: email,
        password: password,
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

    // recovery password
    Future<void> recoveryPassword(String newPassword) async {
      try {
        await firebaseAuth.currentUser!.updatePassword(newPassword);
      } on FirebaseAuthException catch (e) {
        throw Exception(ErrorHandling.handleAuthException(e));
      }
    }
  }
}
