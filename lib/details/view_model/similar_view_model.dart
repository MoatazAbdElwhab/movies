import 'package:flutter/material.dart';
import 'package:movies/details/data/details_data_source/similar_data_source.dart';
import 'package:movies/details/data/models/movie_similar/similar_movie.dart';

class SimilarViewModel with ChangeNotifier {
  final dataSource = SimilarDataSource();

  List<SimilarMovie>? movies;

  String? errorMessage;

  Future<void> getMovieSimilar(String movieId) async {
    try {
      final res = await dataSource.getMovieSimilar(movieId);
      movies = res.results;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
