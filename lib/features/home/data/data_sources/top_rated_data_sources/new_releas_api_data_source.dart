import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/shared/api_constants.dart';
import '../../models/MovieModel.dart';

class NewReleasesApiDataSource {
  static Future<List<Movies>> getNewReleases() async {
    final uri =
        Uri.https(ApiConstants.baseUrl, ApiConstants.newReleasesEndPoint);
    final response = await http.get(
      uri,
      headers: {'Authorization': ApiConstants.bearerToken},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final movies = MovieModel.fromJson(data).results;
      return movies ?? [];
    } else {
      throw Exception('Failed to load new releases');
    }
  }
}
