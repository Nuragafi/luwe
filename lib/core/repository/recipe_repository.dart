import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:luwe/core/model/alat_mode.dart';
import 'package:luwe/core/model/bahan_model.dart';
import 'package:luwe/core/model/group_model.dart';
import 'package:luwe/core/model/recipe_model.dart';
import 'package:luwe/core/utils/constant.dart';
import 'package:luwe/core/utils/handler.dart';
import 'package:luwe/core/utils/headers.dart';
import 'package:luwe/core/utils/log_helper.dart';
import 'package:luwe/core/utils/routes.dart';

class RecipeRepository {
  static Future<RecipeModel> getRecipes({
    int page = 1,
    String? search,
    String? category,
  }) async {
    try {
      final response = await dio.get(
        "${Routes.recipes}/newest",
        queryParameters: {"page": page, "search": search, "category": category},
      );
      if (response.statusCode == 200) {
        return RecipeModel.fromJson(response.data);
      } else {
        throw Exception("Failed to load recipes");
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
    return RecipeModel(data: null);
  }

  static Future<List<AlatModel>> getAlat() async {
    try {
      final response = await dio.get(Routes.alat);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((e) => AlatModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load alat");
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
    return [];
  }

  static Future<List<BahanModel>> getBahan() async {
    try {
      final response = await dio.get(Routes.bahan);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        return data.map((e) => BahanModel.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load bahan");
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
    return [];
  }

  static Future<Map<String, dynamic>?> postRecipe(
    Map<String, dynamic> req,
  ) async {
    try {
      final response = await dio.post(
        Routes.recipes,
        data: FormData.fromMap(req),
        options: Header.head(isMultipart: true),
      );
      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception("Failed to post recipe");
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
    return null;
  }

  static Future<Recipe> getDetail(int id) async {
    try {
      final response = await dio.get("${Routes.recipes}/$id");
      if (response.statusCode == 200) {
        return Recipe.fromJson(response.data['data']);
      } else {
        throw Exception("Failed to load recipe detail");
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
    return Recipe();
  }

  static Future<ExploreModel> getExplore({
    int page = 1,
    String? search,
    String? category,
  }) async {
    try {
      final response = await dio.get(
        Routes.recipesExplore,
        queryParameters: {"page": page, "search": search, "category": category},
      );
      if (response.statusCode == 200) {
        // Log("EXPLORE RESPONSE => ${response.data}");
        return ExploreModel.fromJson(response.data['data']);
      } else {
        throw Exception("Failed to load explore recipes");
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
    return ExploreModel();
  }

  static Future<List<Recipe>> getRecommendation(
    Map<String, dynamic> req,
  ) async {
    try {
      final response = await dio.post(
        Routes.recommendation,
        data: FormData.fromMap(req),
        options: Header.head(),
      );
      if (response.statusCode == 200) {
        // Log("RECOMMENDATION RESPONSE => ${response.data['data']}");
        List<dynamic> data = response.data['data'];
        return data.map((e) => Recipe.fromJson(e['recipe'])).toList();
      } else {
        throw Exception("Failed to load recommendations");
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
    return [];
  }

  static Future addBookmark(int id) async {
    try {
      final response = await dio.post(
        "${Routes.recipes}/$id/favorite",
        options: Header.head(),
      );
      Log("ADD BOOKMARK RESPONSE => ${response.data}");
      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception("Failed to add bookmark");
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
    return null;
  }

  static Future removeBookmark(int id) async {
    try {
      final response = await dio.delete(
        "${Routes.recipes}/$id/favorite",
        options: Header.head(),
      );
      Log("ADD BOOKMARK RESPONSE => ${response.data}");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed to add bookmark");
      }
    } on DioException catch (e) {
      DioHandler(e).handler();
    }
    return null;
  }
}
