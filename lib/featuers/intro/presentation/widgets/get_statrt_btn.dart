import 'package:flutter/material.dart';
import 'package:ustore/common/constant/theme_helper.dart';
import 'package:ustore/config/theme/app_colors.dart';
import 'package:ustore/config/theme/app_font.dart';

class GetStatrtBtn extends StatefulWidget {
  final String text;
  final Function onPressed;
  const GetStatrtBtn({super.key, required this.text, required this.onPressed});

  @override
  State<GetStatrtBtn> createState() => _GetStatrtBtnState();
}

//Ein Ticker ist ein interner Timer in Flutter, der in jeder Frame ein Signal sendet
// (etwa 60 Mal pro Sekunde) und damit sicherstellt, dass Animationen aktualisiert werden.
//🔹 Was macht TickerProviderStateMixin?
//Wenn ein StatefulWidget einen AnimationController benötigt, muss es einen TickerProvider erhalten,
// um die Frames zu verwalten.
//Das TickerProviderStateMixin ermöglicht es dem gesamten State, den Animationscontroller zu steuern und sicherzustellen, dass bei jeder neuen Frame die Werte der Animation aktualisiert werden.
class _GetStatrtBtnState extends State<GetStatrtBtn>
    with TickerProviderStateMixin {
  late AnimationController fadeController;
  late Animation<double> fadeAnimaton;

  @override
  void initState() {
    super.initState();
    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    fadeAnimaton = CurvedAnimation(
      parent: fadeController,
      curve: Curves.easeInExpo,
    );
    fadeController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    fadeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ThemeHelper.isDarkMode(context);
    return FadeTransition(
        opacity: fadeAnimaton,
        child: SizedBox(
          height: 45,
          width: 120,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isDarkMode ? AppColors.accentDark : AppColors.accentLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                widget.onPressed();
              },
              child: Text(
                widget.text,
                style: AppFont.getStatrtBtn,
              )),
        ));
  }
}
