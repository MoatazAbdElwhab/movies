import 'package:flutter/material.dart';
import 'package:movies/search/data/data_sources/remote_data_sources/search_remote_api_data_source.dart';
import '../data/models/SearchModelResponse.dart';

class SearchViewModel extends ChangeNotifier {
  final dataSource = SearchRemoteApiDateSource();
  List<Movie> movies = [];
  bool isLoading = false;
  String? errorMessage;
  String? queryResult;

  Future<void> getSearchMovies(String query) async {
    isLoading = true;
    notifyListeners();
    try {
      movies = await dataSource.getSearchMovies(query);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> clearSearchMovies({bool icon = false}) async {
    queryResult = '';
    movies = [];
    errorMessage = null;
    if (icon) {
      notifyListeners();
    }
  }
}
