import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ustore/featuers/feature_intro/usecase/usecase_splash.dart';

part 'splash_state.dart';
part 'connection_status.dart';

class SplashCubit extends Cubit<SplashState> {
  UsecaseSplash usecaseSplash;
  SplashCubit({required this.usecaseSplash})
      : super(SplashState(connectionStatus: ConnectionInitial()));

  void checkConnectionEvent() {
    emit(state.copyWith(newConnectionStatus: ConnectionInitial()));
    usecaseSplash.checkConnectionEvent().then((value) {
      if (value) {
        emit(state.copyWith(newConnectionStatus: ConnectionOn()));
      } else {
        emit(state.copyWith(newConnectionStatus: ConnectionOff()));
      }
    });
  }
}
