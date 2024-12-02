import 'package:flutter/material.dart';
import 'package:movies/movie_details/data/details_data_source/similar_data_source.dart';
import 'package:movies/shared/models/movie_model.dart';

class SimilarViewModel with ChangeNotifier {
  final dataSource = SimilarDataSource();

  List<MovieModel>? movies;

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
