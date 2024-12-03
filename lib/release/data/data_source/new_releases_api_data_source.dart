import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/home/data/models/MovieModel.dart';
import 'package:movies/shared/api_constants..dart';
import 'package:movies/shared/models/movie_model.dart';

class NewReleasesApiDataSource {
  static Future<List<MovieModel>> getNewReleases() async {
    final uri =
        Uri.https(ApiConstants.baseUrl, ApiConstants.newReleasesEndPoint);
    final response = await http.get(
      uri,
      headers: {'Authorization': ApiConstants.bearerToken},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final moviesResponse = MoviesResponse.fromJson(data);
      return moviesResponse.results ?? [];
    } else {
      throw Exception('Failed to load new releases');
    }
  }
}
