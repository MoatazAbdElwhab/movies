import 'dart:convert';
import 'package:movies/home/data/models/movie_model.dart';
import 'package:movies/shared/api_constants..dart';
import 'package:http/http.dart' as http;
import 'package:movies/shared/models/movie_model.dart';

class PopularMoviesApiDataSource {
  static Future<List<MovieModel>> getPopularMovies() async {
    final uri =
        Uri.https(ApiConstants.baseUrl, ApiConstants.popularMoviesEndPoint);
    final response = await http
        .get(uri, headers: {'Authorization': ApiConstants.bearerToken});
    final responseBody = response.body;
    final json = jsonDecode(responseBody);
    final topRatedMoviesResponse = MoviesResponse.fromJson(json);
    if (response.statusCode == 200 && topRatedMoviesResponse.results != null) {
      return topRatedMoviesResponse.results!;
    } else {
      throw Exception('Failed to fetch top rated movies');
    }
  }
}
