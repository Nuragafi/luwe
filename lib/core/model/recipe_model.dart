import 'dart:convert';

import 'package:luwe/core/model/alat_mode.dart';
import 'package:luwe/core/model/bahan_model.dart';

class RecipeModel {
  bool? success;
  String? message;
  Data? data;

  RecipeModel({this.success, this.message, this.data});

  factory RecipeModel.fromRawJson(String str) =>
      RecipeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? currentPage;
  List<Recipe>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data:
        json["data"] == null
            ? []
            : List<Recipe>.from(json["data"]!.map((x) => Recipe.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links:
        json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links":
        links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Recipe {
  int? id;
  int? userId;
  String? title;
  String? description;
  int? cookingTime;
  String? category;
  dynamic thumbnail;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isFavorited;
  int? favoritesCount;
  String? thumbnailUrl;
  User? user;
  List<dynamic>? images;
  List? steps;
  List<AlatModel>? alats;
  List<BahanModel>? bahans;
  List<dynamic>? favorites;

  Recipe({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.cookingTime,
    this.category,
    this.thumbnail,
    this.createdAt,
    this.updatedAt,
    this.isFavorited,
    this.favoritesCount,
    this.thumbnailUrl,
    this.user,
    this.images,
    this.steps,
    this.alats,
    this.bahans,
    this.favorites,
  });

  factory Recipe.fromRawJson(String str) => Recipe.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["id"],
    userId: json["user_id"],
    title: json["title"],
    description: json["description"],
    cookingTime: json["cooking_time"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    isFavorited: json["is_favorited"],
    favoritesCount: json["favorites_count"],
    thumbnailUrl: json["thumbnail_url"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    images:
        json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
    steps:
        json["steps"] == null
            ? []
            : List<dynamic>.from(json["steps"]!.map((x) => x)),
    alats:
        json["alats"] == null
            ? []
            : List<AlatModel>.from(
              json["alats"]!.map((x) => AlatModel.fromJson(x)),
            ),
    bahans:
        json["bahans"] == null
            ? []
            : List<BahanModel>.from(
              json["bahans"]!.map((x) => BahanModel.fromJson(x)),
            ),
    favorites:
        json["favorites"] == null
            ? []
            : List<dynamic>.from(json["favorites"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "title": title,
    "description": description,
    "cooking_time": cookingTime,
    "category": category,
    "thumbnail": thumbnail,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "is_favorited": isFavorited,
    "favorites_count": favoritesCount,
    "thumbnail_url": thumbnailUrl,
    "user": user?.toJson(),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "steps":
        steps == null ? [] : List<dynamic>.from(steps!.map((x) => x.toJson())),
    "alats":
        alats == null ? [] : List<dynamic>.from(alats!.map((x) => x.toJson())),
    "bahans":
        bahans == null
            ? []
            : List<dynamic>.from(bahans!.map((x) => x.toJson())),
    "favorites":
        favorites == null ? [] : List<dynamic>.from(favorites!.map((x) => x)),
  };
}

// class Image {
//   int? id;
//   int? recipeId;
//   String? imagePath;
//   int? order;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? imageUrl;

//   Image({
//     this.id,
//     this.recipeId,
//     this.imagePath,
//     this.order,
//     this.createdAt,
//     this.updatedAt,
//     this.imageUrl,
//   });

//   factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//     id: json["id"],
//     recipeId: json["recipe_id"],
//     imagePath: json["image_path"],
//     order: json["order"],
//     createdAt:
//         json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt:
//         json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     imageUrl: json["image_url"],
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "recipe_id": recipeId,
//     "image_path": imagePath,
//     "order": order,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "image_url": imageUrl,
//   };
// }

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Link.fromJson(Map<String, dynamic> json) =>
      Link(url: json["url"], label: json["label"], active: json["active"]);

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
