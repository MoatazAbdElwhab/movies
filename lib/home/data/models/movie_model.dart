import 'package:movies/shared/models/movie_model.dart';

class MoviesResponse {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  MoviesResponse({this.page, this.results, this.totalPages, this.totalResults});

  MoviesResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = (json['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
