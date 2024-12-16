import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/category/data/models/categories_response.dart';
import 'package:movies/home/data/models/movie_model.dart';
import 'package:movies/shared/api_constants.dart';

class CategoryDataSource {
  Future<CategoriesResponse> getCategories() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/genre/movie/list'),
      headers: {
        'Authorization': ApiConstants.bearerToken,
      },
    );

    final json = jsonDecode(response.body);
    return CategoriesResponse.fromJson(json);
  }

  Future<MoviesResponse> getMoviesByCategoryId(String categoryId) async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/discover/movie?without_genres=$categoryId'),
      headers: {
        'Authorization': ApiConstants.bearerToken,
      },
    );

    final json = jsonDecode(response.body);
    return MoviesResponse.fromJson(json);
  }
}
