import 'package:dio/dio.dart';
import 'package:luwe/core/storage/user_storage.dart';

import 'package:luwe/core/utils/log_helper.dart';

class Header {
  static Map<String, dynamic> _header = {};

  static Options head({bool isMultipart = false}) {
    _header = {};
    if (storage.token != null) {
      _header["Authorization"] = "Bearer ${storage.token}";
      _header["Accept"] = "application/json";
    }

    if (isMultipart == true) {
      _header["Content-Type"] = "multipart/form-data";
      _header["Accept"] = "application/json";
    }

    Log("HEADER => $_header");
    return Options(headers: _header);
  }
}
