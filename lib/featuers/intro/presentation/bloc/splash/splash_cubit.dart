import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ustore/featuers/intro/usecase/intro_usecase.dart';

part 'splash_state.dart';
part 'connection_status.dart';

class SplashCubit extends Cubit<SplashState> {
  IntroUsecase introUsecase;
  SplashCubit(this.introUsecase)
      : super(SplashState(connectionStatus: ConnectionInitial()));

  void checkConnectionEvent() async {
    emit(state.copyWith(newConnectionStatus: ConnectionInitial()));
    final isConnected = await introUsecase.checkConnectionEvent();
    if (isConnected) {
      emit(state.copyWith(newConnectionStatus: ConnectionOn()));
    } else {
      emit(state.copyWith(newConnectionStatus: ConnectionOff()));
    }
  }
}
