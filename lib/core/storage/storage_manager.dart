import 'package:dio/dio.dart';
import 'package:luwe/core/storage/user_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static Future store(String token) async {
    final session = await prefs;
    session.setString("token", token);
    var tokens = session.getString("token");
    storage.token = tokens;
  }

  static Future destroy() async {
    final session = await prefs;
    storage.token = null;
    session.remove("token");
  }
}
