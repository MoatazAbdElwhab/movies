import 'package:flutter/material.dart';
import 'package:movies/movie_details/view/widgets/movie_details_builder.dart';
import 'package:movies/movie_details/view_model/details_view_model.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class MovieDetailsSection extends StatefulWidget {
  const MovieDetailsSection(this.movieId, {super.key});
  final String movieId;
  @override
  State<MovieDetailsSection> createState() => _MovieDetailsSectionState();
}

class _MovieDetailsSectionState extends State<MovieDetailsSection> {
  final DetailsViewModel viewModel = DetailsViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<DetailsViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.errorMessage != null) {
            return Center(
              child: Text(
                'Error: ${viewModel.errorMessage}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          if (viewModel.movie == null) {
            return const Center(child: LoadingIndicator());
          }
          final movie = viewModel.movie!;
          return MovieDetailsBuilder(
            movie: movie,
          );
        },
      ),
    );
  }
}
