import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ustore/data/models/app_user.dart';
import 'package:ustore/data/models/profile.dart';
import 'package:ustore/featuers/auth/presentation/cubit/auth_data_status.dart';
import 'package:ustore/featuers/auth/usecase/auth_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase authUsecase;
  AuthCubit(this.authUsecase) : super(AuthState(status: AuthDataInitial()));

  Future<void> signUp(
      Profile profile, String repeatPassword, String locale) async {
    emit(state.copyWith(newStatus: AuthDataLoading()));
    try {
      await authUsecase.signUp(profile, repeatPassword, locale);
      emit(state.copyWith(newStatus: AuthSignUpSuccess(profile)));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(newStatus: AuthDataFailure(e)));
    }
  }

  Future<void> signIn(AppUser user) async {
    emit(state.copyWith(newStatus: AuthDataLoading()));
    try {
      await authUsecase.signIn(user);
      emit(state.copyWith(newStatus: AuthSignInSuccess(user)));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(newStatus: AuthDataFailure(e)));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(newStatus: AuthDataLoading()));
    try {
      await authUsecase.signOut();
      emit(state.copyWith(newStatus: AuthSignOutSuccess()));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(newStatus: AuthDataFailure(e)));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(state.copyWith(newStatus: AuthDataLoading()));
    try {
      await authUsecase.resetPassword(email);
      emit(state.copyWith(newStatus: AuthResetPassword(email)));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(newStatus: AuthDataFailure(e)));
    }
  }
}
