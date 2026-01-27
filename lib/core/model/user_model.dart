class User {
  int id;
  String name;
  String email;
  String profilePicture;
  DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    profilePicture: json["profile_picture"],
    createdAt: DateTime.parse(json["created_at"]),
  );
}
