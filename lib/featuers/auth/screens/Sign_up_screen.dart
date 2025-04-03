import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/config/theme/app_font.dart';
import 'package:ustore/gen/assets.gen.dart';
import 'package:ustore/utils/widgets/custom_button.dart';
import 'package:ustore/utils/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  static const signUp = '/sign-up-screen';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = LanguageManager().locale;
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 150, 20, 50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                    SvgPicture.asset(
                      Assets.images.blankProfile,
                      width: 100,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                CustomTextField(
                    isOptional: true,
                    prefixIcon: CupertinoIcons.person,
                    controller: fullNameController,
                    placeholder:
                        locale == 'de' ? "Vollständiger Name" : "Full Name",
                    title: "Full Name"),
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
                    title: "Phone"),
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
                      : "repeat password",
                  isSecure: true,
                  iconBefore: CupertinoIcons.eye,
                  iconAfter: CupertinoIcons.eye_slash,
                ),
                SizedBox(height: 50),
                CustomButton(
                    text: locale == 'de' ? "Registrieren" : "Sign Up",
                    textColor:
                        isDarkMode ? AppColors.greyLight : AppColors.background,
                    backgroundColor: isDarkMode
                        ? AppColors.accentDark
                        : AppColors.accentLight,
                    onPressed: () {}),
              ]),
        ),
      ),
    );
  }
}
