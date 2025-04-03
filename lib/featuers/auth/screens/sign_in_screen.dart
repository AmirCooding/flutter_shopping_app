import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/config/theme/app_font.dart';
import 'package:ustore/gen/assets.gen.dart';
import 'package:ustore/utils/widgets/custom_button.dart';
import 'package:ustore/utils/widgets/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  static const signIn = '/sign-in-screen';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final isDarkMode = ThemeHelper.isDarkMode(context);
    final locale = LanguageManager().locale;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Assets.images.ustoreTextLogo.image(width: 230)),
            SizedBox(height: 40),
            Text(
              locale == 'de' ? "Anmelden" : "Sigin In",
              style: isDarkMode ? AppFont.darkHeading2 : AppFont.lightHeading2,
            ),
            CustomTextField(
                prefixIcon: CupertinoIcons.mail,
                controller: emailController,
                placeholder: locale == 'de'
                    ? "Geben Sie Ihre E-Mail..."
                    : "Enter your Email...",
                title: "Email"),
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
                  onPressed: () {},
                  child: Text(
                    locale == 'de' ? "Passwort vergessen?" : "Forgot Password?",
                    style: TextStyle(
                      color:
                          isDarkMode ? AppColors.accentDark : AppColors.accent,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomButton(
                text: locale == 'de' ? "Anmelden" : "Sign In",
                textColor:
                    isDarkMode ? AppColors.greyLight : AppColors.background,
                backgroundColor:
                    isDarkMode ? AppColors.accentDark : AppColors.accentLight,
                onPressed: () {}),
            Row(
              children: [
                Text(
                  locale == 'de'
                      ? "Sie haben kein Konto?"
                      : "Don't have an account?",
                  style: TextStyle(
                    color:
                        isDarkMode ? AppColors.greyLight : AppColors.greyDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    locale == 'de' ? "Registerieren Sie sich" : "Sign up",
                    style: TextStyle(
                      color:
                          isDarkMode ? AppColors.accentDark : AppColors.accent,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 40),
            CustomButton(
                isImage: true,
                iconImage: Assets.images.google.path,
                text: locale == 'de'
                    ? "Weiter mit Google"
                    : "Continue with Google",
                textColor:
                    isDarkMode ? AppColors.greyLight : AppColors.background,
                backgroundColor: isDarkMode
                    ? AppColors.googleButton
                    : AppColors.buttonSecondary,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
