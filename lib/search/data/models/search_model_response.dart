import 'package:movies/shared/models/movie_model.dart';

class SearchModelResponse {
  SearchModelResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  SearchModelResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;
}
