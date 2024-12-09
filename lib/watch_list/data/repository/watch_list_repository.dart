import 'package:movies/watch_list/data/data_sources/movies_watch_list_firebase_data_source.dart';
import 'package:movies/watch_list/data/models/movie_fav.dart';

class WatchListRepository {
  final MoviesWatchListFirebaseDataSource dataSource =
      MoviesWatchListFirebaseDataSource();

  Future<void> addMovieToFireStore(MovieFav movie) async {
    await dataSource
        .addMovieToFireStore(movie)
        .timeout(
          const Duration(microseconds: 100),
          onTimeout: () {},
        )
        .catchError((error) {});
  }

  Future<void> removeMovieToFireStore(MovieFav movie) async {
    await dataSource
        .removeMovieToFireStore(movie)
        .timeout(
          const Duration(microseconds: 100),
          onTimeout: () {},
        )
        .catchError((error) {});
  }

  Future<List<MovieFav>> getMoviesToFireStore() async {
    return await dataSource.getMoviesToFireStore();
  }
}
