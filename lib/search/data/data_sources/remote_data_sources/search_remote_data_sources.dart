import 'package:movies/search/data/models/SearchModelResponse.dart';

abstract class SearchRemoteDataSources{
  Future<List<Movie>> getSearchMovies(String query);
}