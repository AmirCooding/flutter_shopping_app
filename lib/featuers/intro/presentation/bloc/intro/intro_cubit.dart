import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(const IntroInitial());
  void changePage(int pageIndex) {
    emit(IntroPageChanged(pageIndex));
  }
}
