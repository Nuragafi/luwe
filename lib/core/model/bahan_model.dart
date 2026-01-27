class BahanModel {
  final int? id;
  final String? name;
  final List<String>? units;
  final int? jumlah;
  final Map<String, dynamic>? pivot;

  BahanModel({this.id, this.name, this.units, this.jumlah, this.pivot});

  factory BahanModel.fromJson(Map<String, dynamic> json) => BahanModel(
    id: json['id'],
    name: json['name'],
    units: json['units'] != null ? List.from(json['units']) : [],
    jumlah: json['jumlah'] ?? 0,
    pivot:
        json['pivot'] != null ? Map<String, dynamic>.from(json['pivot']) : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'units': units != null ? List<dynamic>.from(units!) : [],
    'jumlah': jumlah,
    'pivot': pivot != null ? Map<String, dynamic>.from(pivot!) : null,
  };
}
