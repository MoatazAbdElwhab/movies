import 'package:flutter/material.dart';
import 'package:movies/details/data/models/movie_similar/similar_movie.dart';
import 'package:movies/details/view/widgets/movie_item.dart';
import 'package:movies/details/view_model/similar_view_model.dart';
import 'package:movies/shared/app_theme.dart';
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
          }
          if (viewModel.movies == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final movies = viewModel.movies;
          return SafeArea(
            bottom: true,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: AppTheme.greyDarkColor,
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'More Like This',
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => MovieItem(
                        movie: movies[index],
                      ),
                      itemCount: movies!.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
