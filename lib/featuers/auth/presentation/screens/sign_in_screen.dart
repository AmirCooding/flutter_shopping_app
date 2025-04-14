import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/error_handling.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/pending_user_action.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/common/user_action_manager.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/config/theme/app_font.dart';
import 'package:ustore/data/models/app_user.dart';
import 'package:ustore/featuers/auth/presentation/cubit/auth_cubit.dart';
import 'package:ustore/featuers/auth/presentation/cubit/auth_data_status.dart';
import 'package:ustore/featuers/cart/presentation/screens/cart_screen.dart';
import 'package:ustore/featuers/favorite/presentation/screens/favorite_screen.dart';
import 'package:ustore/featuers/home/presentation/screens/home_screen.dart';
import 'package:ustore/featuers/setting/presentation/Screens/profile_screen.dart';
import 'package:ustore/gen/assets.gen.dart';
import 'package:ustore/locator.dart';
import 'package:ustore/utils/widgets/custom_button.dart';
import 'package:ustore/utils/widgets/custom_snakbar.dart';
import 'package:ustore/utils/widgets/custom_text_field.dart';
import 'package:ustore/utils/widgets/loading_screen.dart';
import 'package:ustore/utils/widgets/prefs_operator.dart';

class SignInScreen extends StatelessWidget {
  static const signIn = '/sign-in-screen';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final isDarkMode = ThemeHelper.isDarkMode(context);
    final locale = LanguageManager().locale;

    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state.status is AuthDataFailure) {
            final error = (state.status as AuthDataFailure).error;
            CustomSnakbar.showSnackError(
              context,
              ErrorHandling.handleAuthException(error),
            );
          }

          if (state.status is AuthSignInSuccess) {
            final user = (state.status as AuthSignInSuccess).user;
            final prefs = locator<PrefsOperator>();
            await prefs.saveuserData(user.token ?? '', user.email ?? '');
            final userActionManager = locator<UserActionManager>();
            final pendingAction = userActionManager.getPendingAction();
            if (pendingAction != null) {
              switch (pendingAction.actionType) {
                case PendingActionType.addToFavorites:
                  Navigator.pushNamedAndRemoveUntil(
                      context, FavoriteScreen.favoriteScreen, (route) => false);
                  break;
                case PendingActionType.addToCart:
                  Navigator.pushNamedAndRemoveUntil(
                      context, CartScreen.cartScreen, (route) => false);
                  break;
                case PendingActionType.goToProfile:
                  Navigator.pushNamedAndRemoveUntil(
                      context, ProfileScreen.profileScreen, (route) => false);
                  break;
                case PendingActionType.none:
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScreen.home, (route) => false);
                  break;
              }
            }
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/main-screen',
              (route) => false,
            );
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state.status is AuthDataLoading) {
              return const LoadingScreen();
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Assets.images.ustoreTextLogo.image(width: 230)),
                  const SizedBox(height: 40),
                  Text(
                    locale == 'de' ? "Anmelden" : "Sign In",
                    style: isDarkMode
                        ? AppFont.darkHeading2
                        : AppFont.lightHeading2,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    prefixIcon: CupertinoIcons.mail,
                    controller: emailController,
                    placeholder: locale == 'de'
                        ? "Geben Sie Ihre E-Mail..."
                        : "Enter your Email...",
                    title: "Email",
                  ),
                  CustomTextField(
                    prefixIcon: CupertinoIcons.lock,
                    controller: passwordController,
                    placeholder: locale == 'de'
                        ? "Geben Sie Ihre Passwort ein ..."
                        : "Enter your Password...",
                    title: locale == 'de' ? "Passwort" : "Password",
                    isSecure: true,
                    iconBefore: CupertinoIcons.eye,
                    iconAfter: CupertinoIcons.eye_slash,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/recovery-password-screen',
                          );
                        },
                        child: Text(
                          locale == 'de'
                              ? "Passwort vergessen?"
                              : "Forgot Password?",
                          style: TextStyle(
                            color: isDarkMode
                                ? AppColors.accentDark
                                : AppColors.accent,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: locale == 'de' ? "Anmelden" : "Sign In",
                    textColor:
                        isDarkMode ? AppColors.greyLight : AppColors.background,
                    backgroundColor: isDarkMode
                        ? AppColors.accentDark
                        : AppColors.accentLight,
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        CustomSnakbar.showSnackError(
                          context,
                          ErrorHandling.getErrorMessage(
                              ErrorHandling.EMPTY_FIELD),
                        );
                        return;
                      }

                      final user = AppUser(email: email, password: password);
                      context.read<AuthCubit>().signIn(user);
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        locale == 'de'
                            ? "Sie haben kein Konto?"
                            : "Don't have an account?",
                        style: TextStyle(
                          color: isDarkMode
                              ? AppColors.greyLight
                              : AppColors.greyDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign-up-screen');
                        },
                        child: Text(
                          locale == 'de' ? "Registrieren " : "Sign up",
                          style: TextStyle(
                            color: isDarkMode
                                ? AppColors.accentDark
                                : AppColors.accent,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  CustomButton(
                    isImage: true,
                    iconImage: Assets.images.google.path,
                    text: locale == 'de'
                        ? "Weiter mit Google"
                        : "Continue with Google",
                    textColor:
                        isDarkMode ? AppColors.greyLight : AppColors.background,
                    backgroundColor: AppColors.googleButton,
                    onPressed: () {
                      // Google sign-in to be added here
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
