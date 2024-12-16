import 'package:flutter/material.dart';
import 'package:movies/movie_details/view/screens/movie_details.dart';
import 'package:movies/release/view_model/new_releases_view_model.dart';
import 'package:movies/shared/api_constants.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/favorite_button.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/shared/widgets/movie_img_home.dart';
import 'package:movies/watch_list/data/models/movie_fav.dart';
import 'package:provider/provider.dart';

class NewReleasesWidget extends StatefulWidget {
  const NewReleasesWidget({super.key});

  @override
  State<NewReleasesWidget> createState() => _NewReleasesWidgetState();
}

class _NewReleasesWidgetState extends State<NewReleasesWidget> {
  final NewReleasesViewModel newReleasesViewModel = NewReleasesViewModel();

  @override
  void initState() {
    super.initState();

    newReleasesViewModel.fetchNewReleases();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: newReleasesViewModel,
      child: Consumer<NewReleasesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          } else if (viewModel.newReleases.isEmpty) {
            return const Center(child: Text('No new releases found'));
          } else {
            return Container(
              color: AppTheme.dark2Color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Text(
                      'New Releases',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.newReleases.length,
                      itemBuilder: (context, index) {
                        final movie = viewModel.newReleases[index];
                        final imgUrl = movie.posterPath != null
                            ? ApiConstants.imageBaseUrl + movie.posterPath!
                            : 'assets/images/placeholder_image.jpg';
                        return Padding(
                          padding: const EdgeInsetsDirectional.only(
                            start: 12,
                            bottom: 8,
                          ),
                          child: Stack(children: [
                            InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MovieDetails(
                                  title: movie.title!,
                                  movieId: movie.id!,
                                ),
                              )),
                              child: MovieImgHome(imgUrl: imgUrl),
                            ),
                            FavoriteButton(
                              movieFav: MovieFav(
                                id: movie.id!,
                                title: movie.title!,
                                date: movie.releaseDate!,
                                imgPath: movie.posterPath!,
                              ),
                            ),
                          ]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
