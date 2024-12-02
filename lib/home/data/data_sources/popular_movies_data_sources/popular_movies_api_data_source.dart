import 'dart:convert';
import 'package:movies/home/data/models/MovieModel.dart';
import 'package:movies/shared/api_constants..dart';
import 'package:http/http.dart' as http;

class PopularMoviesApiDataSource {
  static Future<List<Movies>> getPopularMovies() async {
    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.topRatedEndPoint);
    final response = await http
        .get(uri, headers: {'Authorization': ApiConstants.bearerToken});
    final responseBody = response.body;
    final json = jsonDecode(responseBody);
    final topRatedMoviesResponse = MovieModel.fromJson(json);
    if (response.statusCode == 200 && topRatedMoviesResponse.results != null) {
      return topRatedMoviesResponse.results!;
    } else {
      throw Exception('Failed to fetch top rated movies');
    }
  }
}