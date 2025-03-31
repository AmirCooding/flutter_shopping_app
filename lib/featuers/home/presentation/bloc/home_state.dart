part of 'home_cubit.dart';

class HomeState {
  final HomeDataStatus dataStatus;
  final int banerIndex;
  final List<String?> bannerImages;
  HomeState(
      {required this.dataStatus,
      this.banerIndex = 0,
      this.bannerImages = const []});

  HomeState copyWith({
    HomeDataStatus? newDataStatus,
    List<String?>? newBannerImages,
    int? newBanerIndex,
  }) {
    return HomeState(
      dataStatus: newDataStatus ?? dataStatus,
      bannerImages: newBannerImages ?? bannerImages,
      banerIndex: newBanerIndex ?? banerIndex,
    );
  }
}
