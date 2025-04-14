abstract class MainWrapperDataStatus {}

class MainWrapperDataLoading extends MainWrapperDataStatus {}

class MainWrapperDataLoaded extends MainWrapperDataStatus {
  final int favoritesCount;
  MainWrapperDataLoaded({required this.favoritesCount});
}

class MainWrapperDataError extends MainWrapperDataStatus {
  final String message;
  MainWrapperDataError({required this.message});
}
