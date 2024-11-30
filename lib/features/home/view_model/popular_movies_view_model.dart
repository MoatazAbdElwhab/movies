import 'package:flutter/cupertino.dart';
import 'package:movies/features/home/data/models/MovieModel.dart';
import '../data/data_sources/popular_movies_data_sources/popular_movies_api_data_source.dart';

class PopularMoviesViewModel extends ChangeNotifier {
  List<Movies> movies = [];
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
