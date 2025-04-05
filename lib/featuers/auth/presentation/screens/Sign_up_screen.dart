import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ustore/common/custom_app.dart';
import 'package:ustore/common/custom_snakbar.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/config/theme/app_font.dart';
import 'package:ustore/data/models/app_user.dart';
import 'package:ustore/data/models/profile.dart';
import 'package:ustore/featuers/auth/presentation/cubit/auth_cubit.dart';
import 'package:ustore/featuers/auth/presentation/cubit/auth_data_status.dart';
import 'package:ustore/featuers/auth/presentation/screens/sign_in_screen.dart';
import 'package:ustore/featuers/auth/widgets/profile_image_picker.dart';
import 'package:ustore/utils/widgets/custom_button.dart';
import 'package:ustore/utils/widgets/custom_text_field.dart';
import 'package:ustore/utils/widgets/loading_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const signUp = '/sign-up-screen';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final ValueNotifier<String?> profileImagePath = ValueNotifier(null);

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = LanguageManager().locale;
    final isDarkMode = ThemeHelper.isDarkMode(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status is AuthDataFailure) {
            CustomSnakbar.showSnackError(
              context,
              (state.status as AuthDataFailure).error.message ?? "Error",
            );
          }

          if (state.status is AuthSignUpSuccess) {
            Navigator.pushNamed(context, SignInScreen.signIn);
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locale == 'de'
                                  ? "Ein Konto erstellen"
                                  : "Create an Account",
                              style: isDarkMode
                                  ? AppFont.darkHeading
                                  : AppFont.lightHeading,
                            ),
                            Text(
                              locale == 'de'
                                  ? "Geben Sie Ihre Daten ein, um sich anzumelden"
                                  : "Enter your Details to Sign Up",
                              style: isDarkMode
                                  ? AppFont.darkHeading3
                                  : AppFont.lightHeading3,
                            ),
                          ],
                        ),
                        ProfileImagePicker(
                          onImagePicked: (path) =>
                              profileImagePath.value = path,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      isOptional: true,
                      prefixIcon: CupertinoIcons.person,
                      controller: fullNameController,
                      placeholder:
                          locale == 'de' ? "Vollständiger Name" : "Full Name",
                      title: "Full Name",
                    ),
                    CustomTextField(
                      prefixIcon: CupertinoIcons.mail,
                      controller: emailController,
                      placeholder: locale == 'de'
                          ? "Geben Sie Ihre E-Mail..."
                          : "Enter your Email...",
                      title: "Email",
                      isOptional: true,
                    ),
                    CustomTextField(
                      prefixIcon: CupertinoIcons.phone,
                      controller: phoneController,
                      placeholder: locale == 'de'
                          ? "Geben Sie Ihre Tel..."
                          : "Enter your Tel...",
                      title: "Phone",
                    ),
                    CustomTextField(
                      isOptional: true,
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
                    CustomTextField(
                      isOptional: true,
                      prefixIcon: CupertinoIcons.lock,
                      controller: repeatPasswordController,
                      placeholder: locale == 'de'
                          ? "Geben Sie Ihre Passwort ein ..."
                          : "Enter your Password...",
                      title: locale == 'de'
                          ? "Passwort wiederholen"
                          : "Repeat Password",
                      isSecure: true,
                      iconBefore: CupertinoIcons.eye,
                      iconAfter: CupertinoIcons.eye_slash,
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      text: locale == 'de' ? "Registrieren" : "Sign Up",
                      textColor: isDarkMode
                          ? AppColors.greyLight
                          : AppColors.background,
                      backgroundColor: isDarkMode
                          ? AppColors.accentDark
                          : AppColors.accentLight,
                      onPressed: () async {
                        final user = AppUser(
                          email: emailController.text,
                          password: passwordController.text.trim(),
                        );
                        debugPrint(passwordController.text.trim());
                        debugPrint(repeatPasswordController.text.trim());
                        final profile = Profile(
                          uid: user.uid,
                          fullName: fullNameController.text,
                          user: user,
                          image: profileImagePath.value,
                          phone: phoneController.text,
                          address: null,
                          paymentMethod: null,
                        );

                        try {
                          await context.read<AuthCubit>().signUp(
                                profile,
                                repeatPasswordController.text.trim(),
                              );
                        } catch (e) {
                          CustomSnakbar.showSnackError(context, e.toString());
                          return;
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
