/*
import 'package:movies/shared/models/movie_model.dart';

class MoviesResponse {
  List<MovieModel>? results;

  MoviesResponse({this.results});

  MoviesResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = (json['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    }
  }
}*/
