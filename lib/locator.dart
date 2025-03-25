import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustore/common/constant/prefs_operator.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/intro_firebase_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_storage/storage_service.dart';
import 'package:ustore/featuers/intro/presentation/bloc/splash/splash_cubit.dart';
import 'package:ustore/featuers/intro/repository/intro_data_repository.dart';
import 'package:ustore/featuers/intro/repository/intro_repository_impl.dart';
import 'package:ustore/featuers/intro/usecase/intro_usecase.dart';

final GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerLazySingleton<IntroDataRepository>(
      () => IntroDataRepositoryImpl(locator(), introFirbaseService: locator()));
  locator.registerSingleton<Dio>(Dio());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(PrefsOperator());
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
  locator.registerLazySingleton(() => FirebaseStorage.instance);
  locator.registerLazySingleton<IntroFirbaseService>(
      () => IntroFirbaseService(firestore: locator()));
  locator.registerLazySingleton<StorageService>(
      () => StorageService(firebaseStorage: locator()));
  locator.registerLazySingleton<IntroUsecase>(
      () => IntroUsecase(introRepository: locator()));
  //locator.registerFactory(() => SplashCubit(introUsecase: locator()));
}
