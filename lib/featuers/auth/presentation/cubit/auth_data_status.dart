import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:ustore/data/models/app_user.dart';
import 'package:ustore/data/models/profile.dart';

@immutable
abstract class AuthDataStatus {}

class AuthDataInitial extends AuthDataStatus {}

class AuthDataLoading extends AuthDataStatus {}

class AuthSignUpSuccess extends AuthDataStatus {
  final Profile profile;
  AuthSignUpSuccess(this.profile);
}

class AuthSignInSuccess extends AuthDataStatus {
  final AppUser user;
  AuthSignInSuccess(this.user);
}

class AuthResetPassword extends AuthDataStatus {
  final String email;
  AuthResetPassword(this.email);
}

class AuthSignOutSuccess extends AuthDataStatus {}

class AuthDataFailure extends AuthDataStatus {
  final FirebaseAuthException error;

  AuthDataFailure(this.error);
}
