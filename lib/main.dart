import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/utils/widgets/loading_screen.dart';
import 'package:ustore/common/utils/widgets/no_internent.dart';
import 'package:ustore/featuers/home/presentation/screens/home_screen.dart';
import 'package:ustore/featuers/intro/presentation/bloc/splash/splash_cubit.dart';
import 'package:ustore/featuers/intro/presentation/screens/splash_screen.dart';
import 'package:ustore/firebase_options.dart';
import 'package:ustore/setup_locator.dart';
import 'package:ustore/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => SplashCubit(usecaseSplash: locator())),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        NoInternet.routeName: (context) => const NoInternet(),
        LoadingScreen.routeName: (context) => const LoadingScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'UStore',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
