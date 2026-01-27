class AlatModel {
  final int? id;
  final String? name;
  final int? jumlah;
  final Map<String, dynamic>? pivot;

  AlatModel({this.id, this.name, this.jumlah, this.pivot});

  factory AlatModel.fromJson(Map<String, dynamic> json) => AlatModel(
    id: json['id'],
    name: json['name'],
    jumlah: json['jumlah'] ?? 0,
    pivot:
        json['pivot'] != null ? Map<String, dynamic>.from(json['pivot']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'jumlah': jumlah,
    'pivot': pivot != null ? Map<String, dynamic>.from(pivot!) : null,
  };
}
