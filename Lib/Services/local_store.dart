import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  static const _keyUsers = 'fc_users_json';
  static const _keySessionUser = 'fc_session_user';

  static Future<void> saveUsersJson(String jsonString) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_keyUsers, jsonString);
  }

  static Future<String?> loadUsersJson() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(_keyUsers);
  }

  static Future<void> saveSessionUserName(String name) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_keySessionUser, name);
  }

  static Future<String?> loadSessionUserName() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(_keySessionUser);
  }

  static Future<void> clearSession() async {
    final sp = await SharedPreferences.getInstance();
    await sp.remove(_keySessionUser);
  }

  static String encodeJson(Object obj) => jsonEncode(obj);
}