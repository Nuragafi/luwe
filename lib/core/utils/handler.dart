import 'package:dio/dio.dart';
import 'package:luwe/core/utils/log_helper.dart';
import 'package:luwe/core/utils/snackbar_helper.dart';

class DioHandler {
  DioException exception;
  DioHandler(this.exception);
  void handler() {
    Log("TERJADI ERROR => $exception");
    if (exception.response != null) {
      var data = exception.response!.data;
      if (data is Map) {
        if (data.containsKey("message")) {
          Log("ERROR MESSAGE => ${data['message']}");
          Snackbar.error(
            data['message'] is Map
                ? data['message'].values.first[0]
                : data['message'] is String
                ? data['message']
                : "Terjadi kesalahan",
          );
        }
      }
    } else {
      Snackbar.error("Terjadi kesalahan");
    }
  }
}
