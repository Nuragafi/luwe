import 'package:flutter/material.dart';
import 'package:luwe/core/model/alat_mode.dart';
import 'package:luwe/core/model/bahan_model.dart';
import 'package:luwe/core/model/recipe_model.dart';
import 'package:luwe/core/repository/recipe_repository.dart';
import 'package:luwe/core/utils/dialog_helper.dart';
import 'package:luwe/core/utils/log_helper.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/core/utils/snackbar_helper.dart';
import 'package:luwe/ui/components/dialog/loading.dart';
import 'package:luwe/ui/view/dashboard.dart';
import 'package:luwe/ui/view/detail_resep.dart';

class RecipeProvider extends ChangeNotifier {
  final List<Recipe> _recipes = [];
  int page = 0;
  bool _isLoading = false;
  bool hasMore = true;

  bool get isLoading => _isLoading;
  List<Recipe> get recipes => _recipes;

  List<AlatModel> alat = [];
  List<BahanModel> bahan = [];

  Future index() async {
    _isLoading = true;
    RecipeModel data = await RecipeRepository.getRecipes(page: page);
    if (data.data!.data!.isNotEmpty) {
      _recipes.addAll(data.data!.data!);
      page = data.data!.currentPage! + 1;
    } else {
      hasMore = false;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future refresh() async {
    _isLoading = true;
    page = 0;
    _recipes.clear();
    hasMore = true;
    RecipeModel data = await RecipeRepository.getRecipes(page: page);
    if (data.data!.data!.isNotEmpty) {
      _recipes.addAll(data.data!.data!);
      page = data.data!.currentPage! + 1;
    } else {
      hasMore = false;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future getAlat() async {
    alat = await RecipeRepository.getAlat();
    notifyListeners();
  }

  Future getBahan() async {
    bahan = await RecipeRepository.getBahan();
    notifyListeners();
  }

  Future postResep(Map<String, dynamic> req) async {
    DialogHelper.initDialog(const DialogLoading());
    var data = await RecipeRepository.postRecipe(req);
    if (data != null) {
      index();
      Navigation().goReplace(Dashboard());
    } else {
      Snackbar.error('Gagal menambahkan resep');
      Navigation().goBack();
    }

    notifyListeners();
  }

  Future toDetail(int id) async {
    var data = await RecipeRepository.getDetail(id);
    if (data.title != null) {
      Navigation().goPush(DetailResep(recipe: data));
    } else {
      Snackbar.error('Gagal memuat detail resep');
    }
  }

  Future addBookmark(int id) async {
    var data = await RecipeRepository.addBookmark(id);
    Log("Bookmark data: $data");
    if (data != null) {
      recipes.firstWhere((e) => e.id == id).isFavorited = true;
    } else {
      return;
    }
    notifyListeners();
  }

  Future removeBookmark(int id) async {
    var data = await RecipeRepository.removeBookmark(id);
    Log("Remove bookmark data: $data");
    if (data != null) {
      recipes.firstWhere((e) => e.id == id).isFavorited = false;
    } else {
      return;
    }
    notifyListeners();
  }
}
