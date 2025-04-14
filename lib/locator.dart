import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustore/common/user_action_manager.dart';
import 'package:ustore/data/remote/api/store_api_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_auth/app_user_auth.dart';
import 'package:ustore/featuers/auth/repository/auth_repository.dart';
import 'package:ustore/featuers/auth/repository/auth_repository_impl.dart';
import 'package:ustore/featuers/auth/usecase/auth_usecase.dart';
import 'package:ustore/featuers/details/repository/details_reposiotry_impl.dart';
import 'package:ustore/featuers/details/repository/details_repositroy.dart';
import 'package:ustore/featuers/details/usecase/details_usecase.dart';
import 'package:ustore/featuers/home/repository/home_reposiotry.dart';
import 'package:ustore/featuers/home/repository/home_repository_impl.dart';
import 'package:ustore/featuers/home/usecase/home_usecase.dart';
import 'package:ustore/featuers/main_wrapper/main_wrapper_usecase/main_Wrpper_usecase.dart';
import 'package:ustore/featuers/main_wrapper/repository/main_wrapper_repository.dart';
import 'package:ustore/featuers/main_wrapper/repository/main_wrapper_repository_impl.dart';
import 'package:ustore/utils/widgets/prefs_operator.dart';
import 'package:ustore/data/remote/firbase_service/firbase_firestore/firestore_firebase_service.dart';
import 'package:ustore/data/remote/firbase_service/firbase_storage/firebase_storage_service.dart';
import 'package:ustore/featuers/intro/repository/intro_data_repository.dart';
import 'package:ustore/featuers/intro/repository/intro_repository_impl.dart';
import 'package:ustore/featuers/intro/usecase/intro_usecase.dart';

final GetIt locator = GetIt.instance;

void setupLocator() async {
  //Api
  locator.registerLazySingleton<StoreApiService>(() => StoreApiService());
  // Repositrory
  locator.registerLazySingleton<IntroDataRepository>(() =>
      IntroDataRepositoryImpl(
          introFirbaseService: locator(), introStorageService: locator()));
  locator.registerLazySingleton<HomeReposiotry>(() => HomeRepositoryImpl(
      firstore: locator(), apiService: locator(), storageService: locator()));
  locator.registerLazySingleton<DetailsRepository>(() => DetailsReposiotryImpl(
      firebaseAuthenticationService: locator(),
      firebaseFireSotreService: locator(),
      storeApiService: locator()));

  locator.registerLazySingleton<MainWrapperRepository>(
      () => MainWrapperRepositoryImpl(firestoreFirebaseService: locator()));
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      appUserAuth: locator(),
      firestoreService: locator(),
      storageService: locator()));
  // Http Client
  locator.registerSingleton<Dio>(Dio());
  // SharedPreferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(PrefsOperator());
  // Firebase
  locator.registerLazySingleton(() => FirebaseFirestore.instance);
  locator.registerLazySingleton(() => FirebaseStorage.instance);
  locator.registerLazySingleton(() => FirebaseAuth.instance);
  locator.registerLazySingleton<FirebaseFireSotreService>(
      () => FirebaseFireSotreService(
            apiService: locator(),
            firestore: locator(),
            appUserAuth: locator(),
            storageService: locator(),
          ));
  locator.registerLazySingleton<FirbaseStorageService>(
      () => FirbaseStorageService(firebaseStorage: locator()));
  locator.registerLazySingleton<FirebaseAuthenticationService>(
      () => FirebaseAuthenticationService(firebaseAuth: locator()));

  // UseCase
  locator.registerLazySingleton<IntroUsecase>(
      () => IntroUsecase(introRepository: locator()));
  locator.registerLazySingleton<HomeUsecase>(() => HomeUsecase(locator()));
  locator.registerLazySingleton<DetailsUsecase>(
      () => DetailsUsecase(detailsRepository: locator()));
  locator.registerLazySingleton<AuthUsecase>(() => AuthUsecase(
        authRepository: locator(),
      ));
  locator.registerLazySingleton<MainWrpperUsecase>(() => MainWrpperUsecase(
        locator(),
      ));
  locator.registerLazySingleton(() => UserActionManager());

// Cubits
  //locator.registerFactory(() => SplashCubit(introUsecase: locator()));
  //locator.registerFactory(() => Auth(introUsecase: locator()));
}
