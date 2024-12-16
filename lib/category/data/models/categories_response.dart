import 'category_item_model.dart';

class CategoriesResponse {
  final List<CategoryItemModel> categories;

  const CategoriesResponse({
    required this.categories,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      categories: (json['genres'] as List<dynamic>)
          .map((e) => CategoryItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
