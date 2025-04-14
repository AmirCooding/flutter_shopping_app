part of 'main_wrapper_cubit.dart';

class MainWrapperState {
  final MainWrapperDataStatus dataStatus;
  final int selectedIndex;

  MainWrapperState({
    required this.dataStatus,
    this.selectedIndex = 0,
  });

  MainWrapperState copyWith({
    MainWrapperDataStatus? newDataStatus,
    int? newSelectedIndex,
  }) {
    return MainWrapperState(
      dataStatus: newDataStatus ?? dataStatus,
      selectedIndex: newSelectedIndex ?? selectedIndex,
    );
  }
}
