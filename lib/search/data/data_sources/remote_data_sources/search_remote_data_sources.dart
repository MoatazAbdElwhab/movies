import 'package:movies/shared/models/movie_model.dart';

abstract class SearchRemoteDataSources {
  Future<List<MovieModel>> getSearchMovies(String query);
}
