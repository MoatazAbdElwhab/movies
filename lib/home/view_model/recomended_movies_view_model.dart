import 'package:flutter/cupertino.dart';
import 'package:movies/home/data/data_sources/recomended_movie_api_data_source.dart';
import 'package:movies/shared/models/movie_model.dart';

class RecomendedMoviesViewModel extends ChangeNotifier {
  List<MovieModel> movies = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getRecomendedMovies() async {
    try {
      isLoading = true;
      notifyListeners();
      movies = await RecomendedMovieApiDataSource.getRecomendedMovies();
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
