part of 'auth_cubit.dart';

class AuthState {
  final AuthDataStatus status;
  AuthState({required this.status});
  AuthState copyWith({
    AuthDataStatus? newStatus,
  }) {
    return AuthState(
      status: newStatus ?? status,
    );
  }
}
