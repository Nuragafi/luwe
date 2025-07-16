import 'dart:developer';

import 'package:dio/dio.dart';

class Log {
  static final DateTime _time = DateTime.now();
  static const String _name = "LUWE";
  Log(String message) {
    log(message, time: _time, name: _name);
  }
  static void message(Response res) {
    log("${res.realUri} || RESPONSE => ${res.data}", time: _time, name: _name);
  }

  static void error(Object error) {
    log("ERROR => ${error.toString()}", time: _time, name: _name);
  }
}
