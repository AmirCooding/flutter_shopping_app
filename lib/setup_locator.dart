import 'package:get_it/get_it.dart';
import 'package:ustore/featuers/feature_intro/bloc/splash/splash_cubit.dart';
import 'package:ustore/featuers/feature_intro/repositories/splash_repository_impl.dart';
import 'package:ustore/featuers/feature_intro/usecase/usecase_splash.dart';

final GetIt locator = GetIt.instance;

setupLocator() {
  ////////////// Splash /////////////////

// Register a singleton instance that is created lazily when first accessed.
// ثبت یک اینستنس سینگل‌تون که به صورت تنبل و در اولین دسترسی ساخته می‌شود.
  locator.registerLazySingleton(() => SplashRepositoryImpl());

// Register a singleton instance that is created immediately and shared throughout the app.
// ثبت یک اینستنس سینگل‌تون که بلافاصله ساخته می‌شود و در سرتاسر اپلیکیشن به اشتراک گذاشته می‌شود.
  locator.registerSingleton(() => UsecaseSplash(splashRepository: locator()));

  // Register a factory that creates a new instance every time it is requested.
  // ثبت یک کارخانه که هر بار یک اینستنس جدید ایجاد می‌کند.
  locator.registerFactory(() => SplashCubit(usecaseSplash: locator()));
}
