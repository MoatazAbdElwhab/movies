import 'package:movies/shared/models/movie_model.dart';

class SimilarMovieModel {
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  SimilarMovieModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  SimilarMovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieModel>[];
      json['results'].forEach((v) {
        results!.add(MovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
