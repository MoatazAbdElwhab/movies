import 'package:flutter/material.dart';
import 'package:movies/home/view_model/popular_movies_view_model.dart';
import 'package:movies/home/view_model/recomended_movies_view_model.dart';
import 'package:movies/shared/api_constants..dart';
import 'package:movies/shared/models/movie_model.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/shared/widgets/slider_movies.dart';
import 'package:provider/provider.dart';

class RecomendedItem extends StatefulWidget {
  const RecomendedItem({super.key});

  @override
  State<RecomendedItem> createState() => _RecomendedItemState();
}

class _RecomendedItemState extends State<RecomendedItem> {
  final RecomendedMoviesViewModel recomendedMoviesViewModel =
      RecomendedMoviesViewModel();
  @override
  void initState() {
    super.initState();
    recomendedMoviesViewModel.getRecomendedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecomendedMoviesViewModel>(
      create: (_) => recomendedMoviesViewModel,
      child: Consumer<RecomendedMoviesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          } else if (viewModel.movies.isEmpty) {
            return ErrorIndicator(viewModel.errorMessage!);
          } else {
            return SliderMovies(movies: viewModel.movies, title: 'Recomended');
          }
        },
      ),
    );
  }
}
