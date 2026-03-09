import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/app_user.dart';
import 'local_store.dart';

class UserRepository {
  static const _seedAssetPath = 'assets/data/users.json';

  List<AppUser> _users = [];
  List<AppUser> get users => List.unmodifiable(_users);

  Future<void> init() async {
    // 1) Erst versuchen aus SharedPreferences
    final cached = await LocalStore.loadUsersJson();
    if (cached != null && cached.trim().isNotEmpty) {
      _users = _decodeUsers(cached);
      return;
    }

    // 2) Sonst Seed aus Asset
    final seed = await rootBundle.loadString(_seedAssetPath);
    _users = _decodeUsers(seed);

    // 3) Seed einmal persistieren
    await persist();
  }

  AppUser? findByName(String name) {
    for (final u in _users) {
      if (u.name.toLowerCase() == name.toLowerCase()) return u;
    }
    return null;
  }

  Future<void> add(AppUser user) async {
    _users.add(user);
    await persist();
  }

  Future<void> persist() async {
    final list = _users.map((u) => u.toJson()).toList();
    await LocalStore.saveUsersJson(jsonEncode(list));
  }

  Future<void> resetAllScores() async {
    for (final u in _users) {
      u.score = 0;
    }
    await persist();
  }

  List<AppUser> _decodeUsers(String jsonString) {
    final decoded = jsonDecode(jsonString);
    if (decoded is! List) return [];
    return decoded
        .whereType<Map<String, dynamic>>()
        .map(AppUser.fromJson)
        .toList();
  }
}