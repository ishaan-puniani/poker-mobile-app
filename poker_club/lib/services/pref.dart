import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static Future<String> read(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? "";
  }

  static Future<void> write(String key, String data) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, data);
  }

  static Future<void> writeBool(String key, bool data) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(key, data);
  }

  static Future<bool> readBool(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key) ?? false;
  }

  static Future<void> writeInt(String key, int data) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt(key, data);
  }

  static Future<bool> remove(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove(key);
  }

  static Future<bool> removeAll() async {
    final pref = await SharedPreferences.getInstance();
    return pref.clear();
  }
}
