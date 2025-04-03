import 'package:flutter/material.dart';

class AppColors {
  // **Primary Colors (Based on #0E3493)**
  static const Color primary = Color(0xFF0E3493); // Main primary color
  static const Color primaryLight = Color(0xFF3A5FC9); // Lighter shade
  static const Color primaryDark = Color(0xFF081C61); // Darker shade

  // **Secondary Colors (Complementary Colors)**
  // Warm orange for contrast
  static const Color secondary = Color(0xFFFFA726);
  // Bright11 golden yellow
  static const Color secondaryLight = Color(0xFFFFD95B);
  // Deep orange
  static const Color secondaryDark = Color(0xFFFB8C00);

  // **Accent Colors (For highlights and interactive elements)**
  // Fresh cyan accent color
  static const Color accent = Color(0xFF00ACC1);
  static const Color accentLight = Color(0xFF5CD1E5);
  static const Color accentDark = Color(0xFF007C91);
  static const Color googleButton = Color.fromARGB(255, 62, 113, 244);

  // **Background Colors**
  // Light gray for background
  static const Color background = Color(0xFFF5F5F5);
  // Dark mode background
  static const Color backgroundDark = Color(0xFF121212);

  // **Text Colors**

  /// Main text color for headings and body text
  static const Color textPrimary = Color(0xFF212121);

  /// Gray for subtitles and disabled text
  static const Color textSecondary = Color(0xFF757575);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textBlack = Color(0xFF000000);

  // **Button Colors**
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;

  // **Status Colors**
  ///Green for success messages
  static const Color success = Color(0xFF4CAF50);

  /// Red for errors
  static const Color error = Color(0xFFB00020);

  /// Yellow for warnings
  static const Color warning = Color(0xFFFFC107);

  /// Blue for information
  static const Color info = Color(0xFF2196F3);

  // **Grayscale Colors**
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyDark = Color(0xFF616161);
}
