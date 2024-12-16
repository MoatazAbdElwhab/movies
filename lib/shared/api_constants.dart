abstract class ApiConstants {
  static const String baseUrl = 'api.themoviedb.org';
  static const String popularMoviesEndPoint = '/3/movie/popular';
  static const String searchEndPoint = '/3/search/movie';
  static const String newReleasesEndPoint = '/3/movie/now_playing';
  static const String recomendedEndPoint = '/3/movie/top_rated';

  static const bearerToken =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjcxNzE2Yjg5ZTNhYzA1Y2MyNWUwMzA2YjA1NGU2MCIsIm5iZiI6MTczMjg4MzExNi4yOTc5NjIsInN1YiI6IjY3NDliMDk1ZDM1YThlOTg0OTdlNmU1YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.deZ0JrxtP41ohLrQi-fkyy0MulKP7bYNWBFxoKA_tok';

  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/original';
}
