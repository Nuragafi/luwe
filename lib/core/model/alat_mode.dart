class AlatModel {
  final String? id;
  final String? name;
  final String? description;
  final String? jumlah;

  AlatModel({this.id, this.name, this.description, this.jumlah});

  factory AlatModel.fromJson(Map<String, dynamic> json) {
    return AlatModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}
