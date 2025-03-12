part of 'splash_cubit.dart';

@immutable
class SplashState {
  final ConnectionStatus connectionStatus;
  const SplashState({required this.connectionStatus});

  SplashState copyWith({
    ConnectionStatus? newConnectionStatus,
  }) {
    return SplashState(
        connectionStatus: newConnectionStatus ?? connectionStatus);
  }
}
