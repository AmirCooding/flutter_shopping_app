import 'package:firebase_auth/firebase_auth.dart';
import 'package:ustore/common/error_handling.dart';
import 'package:ustore/data/models/app_user.dart';
import 'package:uuid/uuid.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth firebaseAuth;
  late String? userId = " ";
  FirebaseAuthenticationService({required this.firebaseAuth});

  // Sign up with email and password, generating a custom UID
  Future<AppUser> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      String customUid = Uuid().v4();
      setUserId(customUid);
      User? currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        await currentUser.updateDisplayName(customUid);
      }
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

  setUserId(String uid) {
    userId = uid;
  }

  String getUserId() {
    return userId!;
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
    Future<void> resetPassword(String email) async {
      try {
        await firebaseAuth.sendPasswordResetEmail(email: email);
      } on FirebaseAuthException catch (e) {
        throw (ErrorHandling.handleAuthException(e));
      }
    }
  }

// reset password
  Future<void> resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw (ErrorHandling.handleAuthException(e));
    }
  }

  // update password
  Future<void> updatePassword(String password) async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        await user.updatePassword(password);
      }
    } on FirebaseAuthException catch (e) {
      throw (ErrorHandling.handleAuthException(e));
    }
  }
}
