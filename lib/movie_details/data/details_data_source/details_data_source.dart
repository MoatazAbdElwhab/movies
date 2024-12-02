import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/movie_details/data/models/movie_details/movie_details_model.dart';

class DetailsDataSource {
  Future<MovieDetailsModel> getMovieDetails(String movieId) async {
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/movie/$movieId'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjcxNzE2Yjg5ZTNhYzA1Y2MyNWUwMzA2YjA1NGU2MCIsIm5iZiI6MTczMjg4MzExNi4yOTc5NjIsInN1YiI6IjY3NDliMDk1ZDM1YThlOTg0OTdlNmU1YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.deZ0JrxtP41ohLrQi-fkyy0MulKP7bYNWBFxoKA_tok'
        });

    final json = jsonDecode(response.body);
    return MovieDetailsModel.fromJson(json);
  }
}