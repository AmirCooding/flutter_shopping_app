import 'package:ustore/common/error_handling.dart';
import 'package:ustore/data/models/app_user.dart';
import 'package:ustore/data/models/profile.dart';
import 'package:ustore/featuers/auth/repository/auth_repository.dart';

class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<void> signIn(AppUser user) async {
    try {
      await _authRepository.signInWithEmailAndPassword(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp(
      Profile profile, String repeatPassword, String locale) async {
    ErrorHandling.emailValidation(profile.user.email);
    ErrorHandling.passwordValidation(profile.user.password, repeatPassword);
    ErrorHandling.phoneValidation(profile.phone);
    ErrorHandling.nameValidation(profile.fullName);
    try {
      await _authRepository.signUp(profile);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _authRepository.resetPassword(email);
    } catch (e) {
      rethrow;
    }
  }
}
