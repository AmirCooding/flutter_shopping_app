import 'dart:ui'; // Import for UI functions, including localization
import 'package:shared_preferences/shared_preferences.dart'; // Import for local storage

/// Singleton class for managing language settings
class LanguageManager {
  // Creates a single instance of the class (Singleton)
  static final LanguageManager _instance = LanguageManager._internal();

  // Variable to store the current language
  late String _locale;

  /// Factory constructor that always returns the same instance
  factory LanguageManager() {
    return _instance;
  }

  /// Private constructor for the Singleton pattern
  LanguageManager._internal();

  /// Loads the language setting from local storage or gets the system's locale
  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve stored language if available; otherwise, use the system's locale
    _locale = prefs.getString('app_locale') ?? _getSystemLocale();
  }

  /// Returns the currently set language
  String get locale => _locale;

  /// Updates the language setting and saves it to local storage
  Future<void> setLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();

    // Save the selected language to local storage
    await prefs.setString('app_locale', locale);

    // Update the internal variable
    _locale = locale;
  }

  /// Retrieves the system's locale and returns 'de' if German, otherwise 'en'
  String _getSystemLocale() {
    Locale systemLocale = PlatformDispatcher.instance.locale;
    return systemLocale.languageCode == 'de' ? 'de' : 'en';
  }
}
