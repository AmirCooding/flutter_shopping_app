import 'package:flutter/material.dart';

class ThemeHelper {
  /// Returns true if the current theme is dark.
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
