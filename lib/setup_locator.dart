import 'package:get_it/get_it.dart';
import 'package:ustore/featuers/intro/presentation/bloc/splash/splash_cubit.dart';
import 'package:ustore/featuers/intro/repository/intro_data_repository.dart';
import 'package:ustore/featuers/intro/repository/intro_repository_impl.dart';
import 'package:ustore/featuers/intro/usecase/intro_usecase.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // 1️⃣ Register SplashRepositoryImpl as LazySingleton
  locator.registerLazySingleton<IntroDataRepository>(
      () => IntroDataRepositoryImpl());

  // 2️⃣ Register UsecaseSplash AFTER SplashRepository is registered
  locator.registerLazySingleton<IntroUsecase>(
    () => IntroUsecase(splashRepository: locator<IntroDataRepository>()),
  );

  // 3️⃣ Register SplashCubit AFTER UsecaseSplash is registered
  locator.registerFactory<SplashCubit>(
    () => SplashCubit(usecaseSplash: locator<IntroUsecase>()),
  );
}
