import 'package:ustore/common/error_handling.dart';
import 'package:ustore/data/models/app_user.dart';
import 'package:ustore/data/models/profile.dart';
import 'package:ustore/featuers/auth/repository/auth_repository.dart';

class AuthUsecase {
  final AuthRepository authRepository;
  AuthUsecase({required this.authRepository});

  Future<void> signIn(AppUser user) async {
    try {
      await authRepository.signInWithEmailAndPassword(user);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await authRepository.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp(Profile profile, String repeatPassword) async {
    try {
      ErrorHandling.emailValidation(profile.user.email);
      ErrorHandling.passwordValidation(profile.user.password, repeatPassword);
      ErrorHandling.phoneValidation(profile.phone);
      ErrorHandling.nameValidation(profile.fullName);
      await authRepository.signUp(profile);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await authRepository.resetPassword(email);
    } catch (e) {
      rethrow;
    }
  }
}
