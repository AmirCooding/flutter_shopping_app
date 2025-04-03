import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ustore/common/language_manager.dart';
import 'package:ustore/common/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/config/theme/app_font.dart';
import 'package:ustore/gen/assets.gen.dart';
import 'package:ustore/utils/widgets/custom_button.dart';
import 'package:ustore/utils/widgets/custom_text_field.dart';

class RecoveryPassword extends StatelessWidget {
  static const recoveryPassword = '/recovery-password-screen';
  final TextEditingController emailController = TextEditingController();
  RecoveryPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = LanguageManager().locale;
    final isDarkMode = ThemeHelper.isDarkMode(context);
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
                locale == 'de' ? "Passwort zurücksetzen" : "Reset password",
                style:
                    isDarkMode ? AppFont.darkHeading2 : AppFont.lightHeading2,
              ),
              CustomTextField(
                  prefixIcon: CupertinoIcons.mail,
                  controller: emailController,
                  placeholder: locale == 'de'
                      ? "Geben Sie Ihre E-Mail..."
                      : "Enter your Email...",
                  title: "Email"),
              SizedBox(height: 50),
              CustomButton(
                  text: locale == 'de' ? "Email Senden" : "Send Email",
                  textColor:
                      isDarkMode ? AppColors.greyLight : AppColors.background,
                  backgroundColor:
                      isDarkMode ? AppColors.accentDark : AppColors.accentLight,
                  onPressed: () {}),
            ]),
      ),
    );
  }
}
