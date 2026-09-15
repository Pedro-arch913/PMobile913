import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String _key = 'USER';

  Future<void> setUserStatus(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }

  Future<bool> getUserStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }
}