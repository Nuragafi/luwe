import 'dart:convert';

import 'package:luwe/core/model/recipe_model.dart';

class ExploreModel {
  List<Group>? groups;
  Pagination? pagination;
  Filters? filters;
  int? totalRecipes;

  ExploreModel({this.groups, this.pagination, this.filters, this.totalRecipes});

  factory ExploreModel.fromRawJson(String str) =>
      ExploreModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExploreModel.fromJson(Map<String, dynamic> json) => ExploreModel(
    groups:
        json["groups"] == null
            ? []
            : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
    pagination:
        json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
    filters: json["filters"] == null ? null : Filters.fromJson(json["filters"]),
    totalRecipes: json["total_recipes"],
  );

  Map<String, dynamic> toJson() => {
    "groups":
        groups == null
            ? []
            : List<dynamic>.from(groups!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
    "filters": filters?.toJson(),
    "total_recipes": totalRecipes,
  };
}

class Filters {
  String? search;
  String? sortBy;
  int? minRecipes;

  Filters({this.search, this.sortBy, this.minRecipes});

  factory Filters.fromRawJson(String str) => Filters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    search: json["search"],
    sortBy: json["sort_by"],
    minRecipes: json["min_recipes"],
  );

  Map<String, dynamic> toJson() => {
    "search": search,
    "sort_by": sortBy,
    "min_recipes": minRecipes,
  };
}

class Group {
  String? keyword;
  String? displayName;
  int? count;
  List<Recipe>? recipes;
  CategoryDistribution? categoryDistribution;
  String? primaryCategory;

  Group({
    this.keyword,
    this.displayName,
    this.count,
    this.recipes,
    this.categoryDistribution,
    this.primaryCategory,
  });

  factory Group.fromRawJson(String str) => Group.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    keyword: json["keyword"],
    displayName: json["display_name"],
    count: json["count"],
    recipes:
        json["recipes"] == null
            ? []
            : List<Recipe>.from(
              json["recipes"]!.map((x) => Recipe.fromJson(x)),
            ),
    categoryDistribution:
        json["category_distribution"] == null
            ? null
            : CategoryDistribution.fromJson(json["category_distribution"]),
    primaryCategory: json["primary_category"],
  );

  Map<String, dynamic> toJson() => {
    "keyword": keyword,
    "display_name": displayName,
    "count": count,
    "recipes":
        recipes == null
            ? []
            : List<dynamic>.from(recipes!.map((x) => x.toJson())),
    "category_distribution": categoryDistribution?.toJson(),
    "primary_category": primaryCategory,
  };
}

class CategoryDistribution {
  int? appetizer;
  int? mainCourse;
  int? dessert;

  CategoryDistribution({this.appetizer, this.mainCourse, this.dessert});

  factory CategoryDistribution.fromRawJson(String str) =>
      CategoryDistribution.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryDistribution.fromJson(Map<String, dynamic> json) =>
      CategoryDistribution(
        appetizer: json["appetizer"],
        mainCourse: json["main_course"],
        dessert: json["dessert"],
      );

  Map<String, dynamic> toJson() => {
    "appetizer": appetizer,
    "main_course": mainCourse,
    "dessert": dessert,
  };
}

class Pagination {
  int? currentPage;
  int? perPage;
  int? totalGroups;
  int? totalPages;
  bool? hasNext;
  bool? hasPrev;

  Pagination({
    this.currentPage,
    this.perPage,
    this.totalGroups,
    this.totalPages,
    this.hasNext,
    this.hasPrev,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["current_page"],
    perPage: json["per_page"],
    totalGroups: json["total_groups"],
    totalPages: json["total_pages"],
    hasNext: json["has_next"],
    hasPrev: json["has_prev"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "per_page": perPage,
    "total_groups": totalGroups,
    "total_pages": totalPages,
    "has_next": hasNext,
    "has_prev": hasPrev,
  };
}
