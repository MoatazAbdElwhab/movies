import 'dart:convert';
import 'package:movies/home/data/models/movie_model.dart';
import 'package:movies/shared/api_constants..dart';
import 'package:http/http.dart' as http;
import 'package:movies/shared/models/movie_model.dart';

class RecomendedMovieApiDataSource {
  static Future<List<MovieModel>> getRecomendedMovies() async {
    final uri =
        Uri.https(ApiConstants.baseUrl, ApiConstants.recomendedEndPoint);
    final response = await http
        .get(uri, headers: {'Authorization': ApiConstants.bearerToken});
    final json = jsonDecode(response.body);
    final recomendedMoviesResponse = MoviesResponse.fromJson(json);
    if (response.statusCode == 200 &&
        recomendedMoviesResponse.results != null) {
      return recomendedMoviesResponse.results!;
    } else {
      throw Exception('Failed to fetch top rated movies');
    }
  }
}
