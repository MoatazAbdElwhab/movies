import 'package:flutter/cupertino.dart';
import 'package:movies/features/home/data/data_sources/top_rated_data_sources/top_rated_api_data_source.dart';
import 'package:movies/features/home/data/models/MovieModel.dart';

class TopRatedViewModel extends ChangeNotifier {
  List<Movies> movies = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getTopRatedMovies() async {
    try {
      isLoading = true;
      notifyListeners();
      movies = await TopRatedApiDataSource.getTopRatedMovies();
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
