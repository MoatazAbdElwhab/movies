class CategoryItemModel {
  final int id;
  final String name;

  const CategoryItemModel({
    required this.id,
    required this.name,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      CategoryItemModel(
        id: json['id'] as int,
        name: json['name'] as String,
      );
}
