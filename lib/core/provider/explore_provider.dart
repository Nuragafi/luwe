import 'package:flutter/material.dart';
import 'package:luwe/core/model/group_model.dart';
import 'package:luwe/core/repository/recipe_repository.dart';
import 'package:luwe/core/utils/color_asset.dart';
import 'package:luwe/core/utils/dialog_helper.dart';
import 'package:luwe/core/utils/navigation.dart';
import 'package:luwe/ui/components/dialog/loading.dart';
import 'package:luwe/ui/view/filtered_list.dart';

class ExploreProvider extends ChangeNotifier {
  final List<Group> _recipes = [];
  int page = 0;
  bool _isLoading = false;
  bool _hasMore = true;

  bool get isLoading => _isLoading;
  List<Group> get recipes => _recipes;
  bool get hasMore => _hasMore;

  Future index() async {
    _isLoading = true;
    ExploreModel data = await RecipeRepository.getExplore(page: page);

    if (data.groups!.isNotEmpty) {
      if (data.groups!.length < 12) {
        _hasMore = false;
      }
      _recipes.addAll(data.groups!);
      page = data.pagination!.currentPage! + 1;
    } else {
      _hasMore = false;
    }
    _isLoading = false;

    notifyListeners();
  }

  Future refresh() async {
    _isLoading = true;
    page = 0;
    _recipes.clear();
    _hasMore = true;
    ExploreModel data = await RecipeRepository.getExplore(page: page);
    if (data.groups!.isNotEmpty) {
      if (data.groups!.length < 12) {
        _hasMore = false;
      }
      _recipes.addAll(data.groups!);
      page = data.pagination!.currentPage! + 1;
    } else {
      _hasMore = false;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future getRecommendation(Map<String, dynamic> req) async {
    DialogHelper.initDialog(const DialogLoading());
    var data = await RecipeRepository.getRecommendation(req);
    if (data.isNotEmpty) {
      Navigation().goBack();
      Navigation().goPush(FilteredList(listRecipe: data));
    } else {
      Navigation().goBack();
      DialogHelper.initDialog(
        Dialog(
          backgroundColor: ColorAsset.white,
          child: SizedBox(
            height: 100,
            width: 200,
            child: Center(
              child: Text(
                'Pencarian Tidak Ditemukan',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        null,
        true,
      );
    }
    // _isLoading = false;
  }
}
