import 'package:flutter/cupertino.dart';
import 'package:movies/features/home/data/data_sources/top_rated_data_sources/new_releas_api_data_source.dart';
import 'package:movies/features/home/data/models/MovieModel.dart';

class NewReleasesViewModel extends ChangeNotifier {
  List<Movies> newReleases = [];
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
