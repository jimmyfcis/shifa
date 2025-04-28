import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/data/models/user.dart';

class TokenStorage {
  static const _tokenKey   = 'AUTH_TOKEN';
  static const _userKey    = 'AUTH_USER';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(user.toJson());
    await prefs.setString(_userKey, jsonString);
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);
    if (jsonString == null) return null;
    try {
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return User.fromJson(jsonMap);
    } catch (_) {
      return null;
    }
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }
}
