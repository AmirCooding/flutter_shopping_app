import 'package:get_it/get_it.dart';
import 'package:ustore/featuers/intro/presentation/bloc/splash/splash_cubit.dart';
import 'package:ustore/featuers/intro/repositories/splash_repository.dart';
import 'package:ustore/featuers/intro/repositories/splash_repository_impl.dart';
import 'package:ustore/featuers/intro/usecase/usecase_splash.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // 1️⃣ Register SplashRepositoryImpl as LazySingleton
  locator.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl());

  // 2️⃣ Register UsecaseSplash AFTER SplashRepository is registered
  locator.registerLazySingleton<UsecaseSplash>(
    () => UsecaseSplash(splashRepository: locator<SplashRepository>()),
  );

  // 3️⃣ Register SplashCubit AFTER UsecaseSplash is registered
  locator.registerFactory<SplashCubit>(
    () => SplashCubit(usecaseSplash: locator<UsecaseSplash>()),
  );
}
