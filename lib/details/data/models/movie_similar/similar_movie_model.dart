import 'package:movies/details/data/models/movie_similar/similar_movie.dart';

class SimilarMovieModel {
  int? page;
  List<SimilarMovie>? results;
  int? totalPages;
  int? totalResults;

  SimilarMovieModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  SimilarMovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <SimilarMovie>[];
      json['results'].forEach((v) {
        results!.add(SimilarMovie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
