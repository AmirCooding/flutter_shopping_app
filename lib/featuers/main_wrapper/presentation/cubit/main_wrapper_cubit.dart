import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ustore/featuers/main_wrapper/main_wrapper_usecase/main_Wrpper_usecase.dart';
import 'package:ustore/featuers/main_wrapper/presentation/cubit/main_wrapper_data_status.dart';

part 'main_wrapper_state.dart';

class MainWrapperCubit extends Cubit<MainWrapperState> {
  final MainWrpperUsecase mainWrpperUsecase;
  MainWrapperCubit(this.mainWrpperUsecase)
      : super(MainWrapperState(dataStatus: MainWrapperDataLoading()));

  void updateDataStatus(MainWrapperDataStatus newDataStatus) {
    emit(state.copyWith(newDataStatus: newDataStatus));
  }

  void updateFavoritesCount(int count) {
    //emit(state.copyWith(newDataStatus: MainWrapperDataLoading()));
    emit(state.copyWith(
        newDataStatus: MainWrapperDataLoaded(favoritesCount: count)));
  }

  void updateError(String error) {
    emit(state.copyWith(newDataStatus: MainWrapperDataError(message: error)));
  }

  void updateLoading() {}

  void updateSelectedIndex(int index) {
    emit(state.copyWith(newSelectedIndex: index));
  }
}
