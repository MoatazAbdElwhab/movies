import 'package:flutter/material.dart';
import 'package:movies/category/data/data_sources/category_data_source.dart';
import 'package:movies/category/data/models/category_item_model.dart';
import 'package:movies/shared/models/movie_model.dart';

class CategoryViewModel with ChangeNotifier {
  final dataSource = CategoryDataSource();

  bool isLoading = false;
  List<CategoryItemModel> categories = [];
  List<MovieModel> movies = [];
  String? message;

  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await dataSource.getCategories();
      categories = response.categories;
    } catch (exception) {
      message = exception.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getMoviesByCategoryId(String categoryId) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await dataSource.getMoviesByCategoryId(categoryId);
      movies = response.results!;
    } catch (exception) {
      message = exception.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
