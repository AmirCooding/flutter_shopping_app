import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ustore/common/utils/models/intro_page.dart';
import 'package:ustore/featuers/intro/usecase/intro_usecase.dart';
part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  final IntroUsecase introUsecase;
  IntroCubit(this.introUsecase) : super(IntroLoading());
  void fetchIntroData(String localCode) async {
    emit(IntroLoading());
    final introData = await introUsecase.getIntroPages(localCode);
    if (introData.isNotEmpty) {
      emit(IntroSuccessLoaded(introData));
    } else {
      emit(IntroError('Failed to load intro data'));
    }
  }
}
