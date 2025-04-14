import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/featuers/auth/presentation/cubit/auth_cubit.dart';
import 'package:ustore/featuers/auth/presentation/screens/Sign_up_screen.dart';
import 'package:ustore/featuers/auth/presentation/screens/recovery_password.dart';
import 'package:ustore/featuers/auth/presentation/screens/sign_in_screen.dart';
import 'package:ustore/featuers/cart/presentation/screens/cart_screen.dart';
import 'package:ustore/featuers/details/cubit/details_cubit.dart';
import 'package:ustore/featuers/details/screen/details_screen.dart';
import 'package:ustore/featuers/favorite/presentation/screens/favorite_screen.dart';
import 'package:ustore/featuers/home/presentation/bloc/home_cubit.dart';
import 'package:ustore/featuers/main_wrapper/presentation/cubit/main_wrapper_cubit.dart';
import 'package:ustore/featuers/setting/presentation/Screens/profile_screen.dart';
import 'package:ustore/utils/widgets/loading_screen.dart';
import 'package:ustore/featuers/main_wrapper/presentation/screens/main_wrapper.dart';
import 'package:ustore/utils/widgets/no_internent.dart';
import 'package:ustore/utils/widgets/product_cart_screen.dart';
import 'package:ustore/data/models/product.dart';
import 'package:ustore/featuers/home/presentation/screens/home_screen.dart';
import 'package:ustore/featuers/intro/presentation/bloc/intro/intro_cubit.dart';
import 'package:ustore/featuers/intro/presentation/bloc/splash/splash_cubit.dart';
import 'package:ustore/featuers/intro/presentation/screens/intro_main_wrapper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ustore/featuers/intro/presentation/screens/splash_screen.dart';
import 'package:ustore/common/firebase_options.dart';
import 'package:ustore/locator.dart';
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
      BlocProvider<SplashCubit>(
        create: (context) => SplashCubit(locator()),
      ),
      BlocProvider<IntroCubit>(
        create: (context) => IntroCubit(locator()),
      ),
      BlocProvider<MainWrapperCubit>(
          create: (context) => MainWrapperCubit(locator())),
      BlocProvider<HomeCubit>(create: (context) => HomeCubit(locator())),
      BlocProvider(create: (context) => AuthCubit(locator())),
      BlocProvider<DetailsCubit>(create: (context) => DetailsCubit(locator())),
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
      initialRoute: MainWrapper.mainWrapper,
      //initialRoute: HomeScreen.home,
      //initialRoute: SignInScreen.signIn,

      routes: {
        SplashScreen.splash: (context) => const SplashScreen(),
        ProductDetailsScreen.detailsScreen: (context) => ProductDetailsScreen(),
        CartScreen.cartScreen: (context) => CartScreen(),
        FavoriteScreen.favoriteScreen: (context) => FavoriteScreen(),
        ProfileScreen.profileScreen: (context) => ProfileScreen(),
        HomeScreen.home: (context) => HomeScreen(),
        NoInternet.nointernet: (context) => const NoInternet(),
        LoadingScreen.loading: (context) => const LoadingScreen(),
        IntroMainWrapper.introMainWrapper: (context) => IntroMainWrapper(),
        MainWrapper.mainWrapper: (context) => MainWrapper(),
        SignInScreen.signIn: (context) => SignInScreen(),
        SignUpScreen.signUp: (context) => SignUpScreen(),
        RecoveryPassword.recoveryPassword: (context) => RecoveryPassword(),
        ProductCartScreen.productCart: (context) => ProductCartScreen(
              product: Product.getSampleProduct(),
            ),
      },
      debugShowCheckedModeBanner: false,
      title: 'UStore',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
