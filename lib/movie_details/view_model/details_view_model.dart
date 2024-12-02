import 'package:flutter/material.dart';
import 'package:movies/movie_details/data/details_data_source/details_data_source.dart';
import 'package:movies/movie_details/data/models/movie_details/movie_details_model.dart';

class DetailsViewModel with ChangeNotifier {
  final dataSource = DetailsDataSource();

  MovieDetailsModel? movie;

  String? errorMessage;

  Future<void> getMovieDetails(String movieId) async {
    try {
      final res = await dataSource.getMovieDetails(movieId);
      movie = res;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}