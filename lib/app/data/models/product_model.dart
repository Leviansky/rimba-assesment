class ProductModel {
  String? id;
  String name;

  ProductModel({
    this.id,
    required this.name,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
  };
}
