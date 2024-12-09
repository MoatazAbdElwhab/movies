import 'package:flutter/foundation.dart';
import 'package:movies/watch_list/data/models/movie_fav.dart';
import 'package:movies/watch_list/data/repository/watch_list_repository.dart';

class WatchListViewModel extends ChangeNotifier {
  WatchListRepository watchListRepository = WatchListRepository();
  List<MovieFav> movies = [];
  bool isLoading = false;

  void addMovieToWatchList(MovieFav movie) async {
    await watchListRepository.addMovieToFireStore(movie);
    getMoviesToWatchList();
  }

  void removeMovieToWatchList(MovieFav movie) async {
    await watchListRepository.removeMovieToFireStore(movie);
    getMoviesToWatchList();
  }

  Future<void> getMoviesToWatchList() async {
    // isLoading = true;
    // notifyListeners();
    // movies = await watchListRepository.getMoviesToFireStore();
    // isLoading = false;
    // notifyListeners();
    debugPrint('get');
    Future.delayed(Duration.zero, () async {
      isLoading = true;
      notifyListeners();

      movies = await watchListRepository.getMoviesToFireStore();

      isLoading = false;
      notifyListeners();
    });
  }
}
