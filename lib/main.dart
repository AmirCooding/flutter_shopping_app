import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/constant/language_manager.dart';
import 'package:ustore/common/utils/widgets/loading_screen.dart';
import 'package:ustore/common/utils/widgets/no_internent.dart';
import 'package:ustore/featuers/home/presentation/screens/home_screen.dart';
import 'package:ustore/featuers/intro/presentation/bloc/intro/intro_cubit.dart';
import 'package:ustore/featuers/intro/presentation/bloc/splash/splash_cubit.dart';
import 'package:ustore/featuers/intro/presentation/screens/intro_main_wrapper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ustore/featuers/intro/presentation/screens/splash_screen.dart';
import 'package:ustore/firebase_options.dart';
import 'package:ustore/setup_locator.dart';
import 'package:ustore/config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
      ],
      // Routes
      initialRoute: SplashScreen.splash,
      routes: {
        SplashScreen.splash: (context) => const SplashScreen(),
        HomeScreen.home: (context) => const HomeScreen(),
        NoInternet.nointernet: (context) => const NoInternet(),
        LoadingScreen.loading: (context) => const LoadingScreen(),
        IntroMainWrapper.introMainWrapper: (context) => IntroMainWrapper(),
      },
      debugShowCheckedModeBanner: false,
      title: 'UStore',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
