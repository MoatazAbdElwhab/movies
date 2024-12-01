import 'dart:convert';
import 'package:movies/features/home/data/models/MovieModel.dart';
import 'package:http/http.dart' as http;
import '../../../../../shared/api_constants.dart';

class TopRatedApiDataSource {
  static Future<List<Movies>> getTopRatedMovies() async {
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
