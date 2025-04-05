import 'package:firebase_auth/firebase_auth.dart';
import 'package:ustore/common/language_manager.dart';

class ErrorHandling {
  static var locale = LanguageManager().locale;
  static const String NO_INTERNET_CONNECTION = "No internet connection";
  static const String TIMEOUT = "Timeout";
  static const String UNKNOWN = "Unknown";
  static const String UNAUTHORIZED = "Unauthorized";
  static const String FORBIDDEN = "Forbidden";
  static const String NOT_FOUND = "Not Found";
  static const String INTERNAL_SERVER_ERROR = "Internal Server Error";
  static const String BAD_GATEWAY = "Bad Gateway";
  static const String SERVICE_UNAVAILABLE = "Service Unavailable";
  static const String GATEWAY_TIMEOUT = "Gateway Timeout";
  static const String REQUEST_TIMEOUT = "Request Timeout";
  static const String NETWORK_ERROR = "Network Error";
  static const String UNEXPECTED_ERROR = "Unexpected Error";
  static const String INVALID_RESPONSE = "Invalid Response";
  static const String INVALID_REQUEST = "Invalid Request";
  static const String INVALID_PARAMETER = "Invalid Parameter";
  static const String INVALID_TOKEN = "Invalid Token";
  static const String INVALID_CREDENTIALS = "Invalid Credentials";
  static const String INVALID_EMAIL = "Invalid Email";
  static const String INVALID_PASSWORD = "Invalid Password";
  static const String INVALID_PHONE = "Invalid Phone";
  static const String INVALID_NAME = "Invalid Name";
  static const String INVALID_ADDRESS = "Invalid Address";
  static const String INVALID_DATE = "Invalid Date";
  static const String INVALID_CODE = "Invalid Code";
  static const String INVALID_VERIFICATION = "Invalid Verification";
  static const String INVALID_VERIFICATION_CODE = "Invalid Verification Code";
  static const String CONFLICT = "Conflict";
  static const String PRECONDITION_FAILED = "Precondition Failed";
  static const String PAYLOAD_TOO_LARGE = "Payload Too Large";
  static const String URI_TOO_LONG = "URI Too Long";
  static const String UNSUPPORTED_MEDIA_TYPE = "Unsupported Media Type";
  static const String RANGE_NOT_SATISFIABLE = "Range Not Satisfiable";
  static const String EXPECTATION_FAILED = "Expectation Failed";
  static const String I_AM_A_TEAPOT = "I'm a teapot";
  static const String MISDIRECTED_REQUEST = "Misdirected Request";
  static const String UNPROCESSABLE_ENTITY = "Unprocessable Entity";
  static const String LOCKED = "Locked";
  static const String FAILED_DEPENDENCY = "Failed Dependency";
  static const String TOO_EARLY = "Too Early";
  static const String UPGRADE_REQUIRED = "Upgrade Required";
  static const String PRECONDITION_REQUIRED = "Precondition Required";
  static const String TOO_MANY_REQUESTS = "Too Many Requests";
  static const String REQUEST_HEADER_FIELDS_TOO_LARGE =
      "Request Header Fields Too Large";
  static const String UNAVAILABLE_FOR_LEGAL_REASONS =
      "Unavailable For Legal Reasons";
  static const String UNAVAILABLE_FOR_LEGAL_CATEGROY =
      "Unavailable For Legal Category";
  static const String PRODUCT_NOT_FOUND = "Product Not Found";
  static dynamic handleAuthException(FirebaseAuthException e) {
    if (locale == 'de') {
      switch (e.code) {
        case 'user-not-found':
          return "Benutzer nicht gefunden";
        case 'wrong-password':
          return "Falsches Passwort";
        case 'invalid-email':
          return "Ungültige E-Mail";
        case 'email-already-in-use':
          return "E-Mail bereits in Verwendung";
        case 'operation-not-allowed':
          return "Operation nicht erlaubt";
        case 'weak-password':
          return "Schwaches Passwort";
        default:
          return "Unbekannter Fehler";
      }
    } else {
      switch (e.code) {
        case 'user-not-found':
          return "User not found";
        case 'wrong-password':
          return "Wrong password";
        case 'invalid-email':
          return "Invalid email";
        case 'email-already-in-use':
          return "Email already in use";
        case 'operation-not-allowed':
          return "Operation not allowed";
        case 'weak-password':
          return "Weak password";
        default:
          return "Unknown error";
      }
    }
  }

  static String getErrorMessage(String error) {
    switch (error) {
      case NO_INTERNET_CONNECTION:
        return "No internet connection";
      case TIMEOUT:
        return "Timeout";
      case UNKNOWN:
        return "Unknown";
      case UNAUTHORIZED:
        return "Unauthorized";
      case FORBIDDEN:
        return "Forbidden";
      case NOT_FOUND:
        return "Not Found";
      case INTERNAL_SERVER_ERROR:
        return "Internal Server Error";
      case BAD_GATEWAY:
        return "Bad Gateway";
      case SERVICE_UNAVAILABLE:
        return "Service Unavailable";
      case GATEWAY_TIMEOUT:
        return "Gateway Timeout";
      case REQUEST_TIMEOUT:
        return "Request Timeout";
      case NETWORK_ERROR:
        return "Network Error";
      case UNEXPECTED_ERROR:
        return "Unexpected Error";
      case INVALID_RESPONSE:
        return "Invalid Response";
      case INVALID_REQUEST:
        return "Invalid Request";
      case INVALID_PARAMETER:
        return "Invalid Parameter";
      case INVALID_TOKEN:
        return "Invalid Token";
      case INVALID_CREDENTIALS:
        return "Invalid Credentials";
      case INVALID_EMAIL:
        return "Invalid Email";
      case INVALID_PASSWORD:
        return "Invalid Password";
      case INVALID_PHONE:
        return "Invalid Phone";
      case INVALID_NAME:
        return "Invalid Name";
      case INVALID_ADDRESS:
        return "Invalid Address";
      case INVALID_DATE:
        return "Invalid Date";
      case INVALID_CODE:
        return "Invalid Code";
      case INVALID_VERIFICATION:
        return "Invalid Verification";
      case INVALID_VERIFICATION_CODE:
        return "Invalid Verification Code";
      case CONFLICT:
        return "Conflict";
      case PRECONDITION_FAILED:
        return "Precondition Failed";
      case PAYLOAD_TOO_LARGE:
        return "Payload Too Large";
      case URI_TOO_LONG:
        return "URI Too Long";
      case UNSUPPORTED_MEDIA_TYPE:
        return "Unsupported Media Type";
      case RANGE_NOT_SATISFIABLE:
        return "Range Not Satisfiable";
      case EXPECTATION_FAILED:
        return "Expectation Failed";
      case I_AM_A_TEAPOT:
        return "I'm a teapot";
      case MISDIRECTED_REQUEST:
        return "Misdirected Request";
      case UNPROCESSABLE_ENTITY:
        return "Unprocessable Entity";
      case LOCKED:
        return "Locked";
      case FAILED_DEPENDENCY:
        return "Failed Dependency";
      case TOO_EARLY:
        return "Too Early";
      case UPGRADE_REQUIRED:
        return "Upgrade Required";
      case PRECONDITION_REQUIRED:
        return "Precondition Required";
      case TOO_MANY_REQUESTS:
        return "Too Many Requests";
      case REQUEST_HEADER_FIELDS_TOO_LARGE:
        return "Request Header Fields Too Large";
      case UNAVAILABLE_FOR_LEGAL_REASONS:
        return "Unavailable For Legal Reasons";
      case UNAVAILABLE_FOR_LEGAL_CATEGROY:
        return "Unavailable For Legal Reasons";
      case PRODUCT_NOT_FOUND:
        return "Product Not Found";
      default:
        return "Unknown";
    }
  }

  static dynamic handleResponse(int response) {
    if (locale == 'de') {
      switch (response) {
        case 200:
          return "✅ OK (200)";
        case 201:
          return "✅ Created (201)";
        case 204:
          return "✅ No Content (204)";
        case 400:
          throw Exception("⚠️ Bad Request (400)");
        case 401:
          throw Exception("🚫 Unauthorized (401)}");
        case 403:
          throw Exception("🔒 Forbidden (403)");
        case 404:
          throw Exception("❌ Not Found (404)");
        case 408:
          throw Exception("⏳ Request Timeout (408)");
        case 409:
          throw Exception("⚠️ Conflict (409)");
        case 429:
          throw Exception("🚦 Too Many Requests (429): Slow down!");
        case 500:
          throw Exception("💥 Internal Server Error (500)");
        case 502:
          throw Exception("🌐 Bad Gateway (502)");
        case 503:
          throw Exception("🛠️ Service Unavailable (503)");
        case 504:
          throw Exception("⏳ Gateway Timeout (504)");
        default:
          throw Exception(
              "❓ Unexpected Error ($response): Please try again later!");
      }
    } else {
      switch (response) {
        case 204:
          return "✅ No Content (204)";
        case 400:
          throw Exception("⚠️ Bad Request (400)");
        case 401:
          throw Exception("🚫 Unauthorized (401)}");
        case 403:
          throw Exception("🔒 Forbidden (403)");
        case 404:
          throw Exception("❌ Not Found (404)");
        case 408:
          throw Exception("⏳ Request Timeout (408)");
        case 409:
          throw Exception("⚠️ Conflict (409)");
        case 429:
          throw Exception("🚦 Too Many Requests (429): Slow down!");
        case 500:
          throw Exception("💥 Internal Server Error (500)");
        case 502:
          throw Exception("🌐 Bad Gateway (502)");
        case 503:
          throw Exception("🛠️ Service Unavailable (503)");
        case 504:
          throw Exception("⏳ Gateway Timeout (504)");
        default:
          throw Exception(
              "❓ Unexpected Error ($response): Please try again later!");
      }
    }
  }

  static void passwordValidation(String password, String repeatPassword) {
    if (locale == 'de') {
      if (password != repeatPassword) {
        throw Exception("Passwords do not match");
      }
      if (password.isEmpty) {
        throw Exception("Please fill all fields");
      }
      if (password.length < 6) {
        throw Exception("Password must be at least 6 characters long");
      }
      if (password.length > 20) {
        throw Exception("Password must be at most 20 characters long");
      }
      if (password.contains(" ")) {
        throw Exception("Password cannot contain spaces");
      }
      if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$')
          .hasMatch(password)) {
        throw Exception(
            "Password must contain at least one uppercase letter, one lowercase letter, and one number");
      }
    } else {
      if (password != repeatPassword) {
        throw Exception("Passwords do not match");
      }
      if (password.isEmpty) {
        throw Exception("Please fill all fields");
      }
      if (password.length < 6) {
        throw Exception("Password must be at least 6 characters long");
      }
      if (password.length > 20) {
        throw Exception("Password must be at most 20 characters long");
      }
      if (password.contains(" ")) {
        throw Exception("Password cannot contain spaces");
      }
      if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$')
          .hasMatch(password)) {
        throw Exception(
            "Password must contain at least one uppercase letter, one lowercase letter, and one number");
      }
    }
  }

  static void phoneValidation(String? phone) {
    final locale = LanguageManager().locale;

    if (phone == null || phone.trim().isEmpty) {
      throw Exception(locale == 'de'
          ? "Bitte geben Sie eine Telefonnummer ein"
          : "Please enter a phone number");
    }

    final trimmedPhone = phone.trim();

    if (trimmedPhone.length < 10) {
      throw Exception(locale == 'de'
          ? "Die Telefonnummer muss mindestens 10 Ziffern lang sein"
          : "Phone number must be at least 10 digits long");
    }

    if (trimmedPhone.length > 15) {
      throw Exception(locale == 'de'
          ? "Die Telefonnummer darf maximal 15 Ziffern lang sein"
          : "Phone number must be at most 15 digits long");
    }

    if (trimmedPhone.contains(" ")) {
      throw Exception(locale == 'de'
          ? "Die Telefonnummer darf keine Leerzeichen enthalten"
          : "Phone number cannot contain spaces");
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(trimmedPhone)) {
      throw Exception(locale == 'de'
          ? "Die Telefonnummer darf nur Ziffern enthalten"
          : "Phone number can only contain numbers");
    }
  }

  static void nameValidation(String name) {
    if (locale == 'de') {
      if (name.isEmpty) {
        throw Exception("Bitte fülle alle Felder aus");
      }
      if (name.length < 3) {
        throw Exception("Name muss mindestens 3 Zeichen lang sein");
      }
      if (name.length > 50) {
        throw Exception("Name darf maximal 50 Zeichen lang sein");
      }
      if (name.contains(" ")) {
        throw Exception("Name darf keine Leerzeichen enthalten");
      }
      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
        throw Exception("Name darf nur Buchstaben und Leerzeichen enthalten");
      }
    } else {
      if (name.isEmpty) {
        throw Exception("Please fill all fields");
      }
      if (name.length < 3) {
        throw Exception("Name must be at least 3 characters long");
      }
      if (name.length > 50) {
        throw Exception("Name must be at most 50 characters long");
      }
      if (name.contains(" ")) {
        throw Exception("Name cannot contain spaces");
      }
      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
        throw Exception("Name can only contain letters and spaces");
      }
    }
  }

  static void addressValidation(String address) {
    if (locale == "de") {
      if (address.isEmpty) {
        throw Exception("Bitte fülle alle Felder aus");
      }
      if (address.length < 5) {
        throw Exception("Adresse muss mindestens 5 Zeichen lang sein");
      }
      if (address.length > 100) {
        throw Exception("Adresse darf maximal 100 Zeichen lang sein");
      }
      if (address.contains(" ")) {
        throw Exception("Adresse darf keine Leerzeichen enthalten");
      }
    } else {
      if (address.isEmpty) {
        throw Exception("Please fill all fields");
      }
      if (address.length < 5) {
        throw Exception("Address must be at least 5 characters long");
      }
      if (address.length > 100) {
        throw Exception("Address must be at most 100 characters long");
      }
      if (address.contains(" ")) {
        throw Exception("Address cannot contain spaces");
      }
    }
  }

  static void emailValidation(String email) {
    if (locale == 'de') {
      if (email.isEmpty) {
        throw Exception("Bitte fülle alle Felder aus");
      }
      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          .hasMatch(email)) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
      if (email.length < 5) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
      if (email.length > 50) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
      if (email.contains(" ")) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
      if (email.startsWith("@")) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
      if (email.endsWith("@")) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
      if (email.contains("@@")) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
      if (email.contains("..")) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
      if (email.contains("@.")) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
      if (email.contains(".@")) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
      if (email.contains("..")) {
        throw Exception("Bitte gib eine gültige E-Mail-Adresse ein");
      }
    } else {
      if (email.isEmpty) {
        throw Exception("Please fill all fields");
      }
      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
          .hasMatch(email)) {
        throw Exception("Please enter a valid email");
      }
      if (email.length < 5) {
        throw Exception("Please enter a valid email");
      }
      if (email.length > 50) {
        throw Exception("Please enter a valid email");
      }
      if (email.contains(" ")) {
        throw Exception("Please enter a valid email");
      }
      if (email.startsWith("@")) {
        throw Exception("Please enter a valid email");
      }
      if (email.endsWith("@")) {
        throw Exception("Please enter a valid email");
      }
      if (email.contains("@@")) {
        throw Exception("Please enter a valid email");
      }
      if (email.contains("..")) {
        throw Exception("Please enter a valid email");
      }
      if (email.contains("@.")) {
        throw Exception("Please enter a valid email");
      }
      if (email.contains(".@")) {
        throw Exception("Please enter a valid email");
      }
      if (email.contains("..")) {
        throw Exception("Please enter a valid email");
      }
    }
  }
}
