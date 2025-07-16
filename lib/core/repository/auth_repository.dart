import 'package:dio/dio.dart';
import 'package:luwe/core/utils/constant.dart';
import 'package:luwe/core/utils/handler.dart';
import 'package:luwe/core/utils/log_helper.dart';
import 'package:luwe/core/utils/routes.dart';

class AuthRepository {
  static Future register(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        Routes.register,
        data: FormData.fromMap(data),
      );
      if (response.statusCode == 201) {
        return response.data;
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
  }

  static Future login(Map<String, dynamic> data) async {
    try {
      final response = await dio.post(
        Routes.login,
        data: FormData.fromMap(data),
      );
      if (response.statusCode == 200) {
        // Log("LOGIN RESPONSE => ${response.data}");
        return response.data['data'];
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
  }

  static Future logout() async {
    try {
      final response = await dio.post(Routes.logout);
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
  }
}
