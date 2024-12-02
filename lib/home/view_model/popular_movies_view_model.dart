import 'package:flutter/cupertino.dart';
import 'package:movies/shared/models/movie_model.dart';
import '../data/data_sources/popular_movies_data_sources/popular_movies_api_data_source.dart';

class PopularMoviesViewModel extends ChangeNotifier {
  List<MovieModel> movies = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getTopRatedMovies() async {
    try {
      isLoading = true;
      notifyListeners();
      movies = await PopularMoviesApiDataSource.getPopularMovies();
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
