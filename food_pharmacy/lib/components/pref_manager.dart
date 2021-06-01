import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static String TOKEN = "token";
  static String USER_ID = "userId";
  static String USER_NAME = "userName";
  static String USER_EMAIL = "userEmail";

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static setToken(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(TOKEN, cookie);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(TOKEN) ?? "NA";
  }

  static setUserId(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_ID, cookie);
  }

  static Future<String> getUserId() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(USER_ID) ?? "NA";
  }

  static setName(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_NAME, cookie);
  }

  static Future<String> getName() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(USER_NAME) ?? "NA";
  }

  static setEmail(String cookie) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_EMAIL, cookie);
  }

  static Future<String> getEmail() async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(USER_EMAIL) ?? "NA";
  }
}
