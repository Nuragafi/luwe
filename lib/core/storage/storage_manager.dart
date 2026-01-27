import 'package:dio/dio.dart';
import 'package:luwe/core/storage/user_storage.dart';
import 'package:luwe/core/utils/log_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static Future store(String token) async {
    final session = await prefs;
    session.setString("token", token);
    var tokens = session.getString("token");
    storage.token = tokens;
  }

  static Future getToken() async {
    final session = await prefs;
    var token = session.getString("token");
    if (token != null) {
      storage.token = token;
      return token;
    } else {
      return null;
    }
  }

  static Future onBoard() async {
    final session = await prefs;
    var onBoard = session.getBool("onBoard");
    Log("ONBOARD => $onBoard");
    if (onBoard == null) {
      session.setBool("onBoard", true);
      return true;
    } else {
      return false;
    }
  }

  static Future setOnBoard(bool value) async {
    final session = await prefs;
    session.setBool("onBoard", value);
  }

  static Future destroy() async {
    final session = await prefs;
    storage.token = null;
    session.remove("token");
  }
}
