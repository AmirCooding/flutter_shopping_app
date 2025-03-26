import 'package:shared_preferences/shared_preferences.dart';
import 'package:ustore/locator.dart';

class PrefsOperator {
  late SharedPreferences _prefs;
  PrefsOperator() {
    _prefs = locator<SharedPreferences>();
  }
  saveuserData(token, email) async {
    await _prefs.setString('user_token', token);
    await _prefs.setString('user_email', email);
    await _prefs.setBool('is_logged_in', true);
  }

  geUserToken() {
    return _prefs.getString('user_token');
  }

  changeIntroState() async {
    await _prefs.setBool('is_intro_shown', false);
  }

  Future<bool> getIntroState() async {
    return _prefs.getBool('is_intro_shown') ?? true;
  }

  Future<bool> login() {
    return _prefs.setBool('is_logged_in', true);
  }

  Future<bool> logout() {
    _prefs.clear();
    return _prefs.setBool('is_logged_in', false);
  }
}
