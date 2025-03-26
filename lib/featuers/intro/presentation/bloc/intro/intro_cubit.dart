import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ustore/utils/models/intro_page.dart';
import 'package:ustore/featuers/intro/usecase/intro_usecase.dart';
part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  final IntroUsecase introUsecase;
  int currentIndex = 0; // Speichert den aktuellen Index

  IntroCubit(this.introUsecase) : super(IntroLoadingState());

  void changePage(int pageIndex) {
    currentIndex = pageIndex;
    if (state is IntroLoadedState) {
      final loadedState = state as IntroLoadedState;
      emit(IntroLoadedState(
          introPage: loadedState.introPage, currentIndex: pageIndex));
    }
  }

  void getintroPagesData() async {
    emit(IntroLoadingState());
    final result = await introUsecase.getIntroPages();
    if (result.isEmpty) {
      emit(IntroErrorState(message: 'Error fetching intro pages'));
    } else {
      emit(IntroLoadedState(
          introPage: result, currentIndex: 0)); // Setze Index auf 0
    }
  }
}
