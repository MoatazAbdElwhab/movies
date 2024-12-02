import 'package:flutter/material.dart';
import 'package:movies/movie_details/view_model/similar_view_model.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/shared/widgets/slider_movies.dart';
import 'package:provider/provider.dart';

class SimilarSection extends StatefulWidget {
  const SimilarSection(this.movieId, {super.key});
  final String movieId;

  @override
  State<SimilarSection> createState() => _SimilarSectionState();
}

class _SimilarSectionState extends State<SimilarSection> {
  final SimilarViewModel viewModel = SimilarViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getMovieSimilar(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SimilarViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Center(
              child: Text(
                'Error: ${viewModel.errorMessage}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (viewModel.movies == null) {
            return const Center(child: LoadingIndicator());
          }
          final movies = viewModel.movies;
          return SliderMovies(
            movies: movies,
            title: 'More Like This',
          );
        },
      ),
    );
  }
}
