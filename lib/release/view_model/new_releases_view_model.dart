import 'package:flutter/cupertino.dart';
import 'package:movies/release/data/data_source/new_releases_api_data_source.dart';
import 'package:movies/shared/models/movie_model.dart';

class NewReleasesViewModel extends ChangeNotifier {
  List<MovieModel> newReleases = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> fetchNewReleases() async {
    try {
      isLoading = true;
      notifyListeners();
      newReleases = await NewReleasesApiDataSource.getNewReleases();
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
