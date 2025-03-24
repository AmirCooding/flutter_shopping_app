import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/main.dart';
import 'package:ustore/common/constant/language_manager.dart';
import 'package:ustore/featuers/intro/presentation/bloc/intro/intro_cubit.dart';
import 'package:ustore/featuers/intro/presentation/bloc/splash/splash_cubit.dart';
import 'package:ustore/firebase_options.dart';
import 'package:ustore/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firbaseinit();
  await LanguageManager().loadLanguage();
  setupLocator();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SplashCubit(introUsecase: locator()),
      ),
      BlocProvider(
        create: (context) => IntroCubit(locator()),
      )
    ],
    child: MyApp(),
  ));
}

Future<void> firbaseinit() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
