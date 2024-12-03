import 'package:flutter/material.dart';
import 'package:movies/release/view_model/new_releases_view_model.dart';
import 'package:movies/shared/api_constants..dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/shared/widgets/movie_img_home.dart';
import 'package:provider/provider.dart';

class NewReleasesWidget extends StatefulWidget {
  const NewReleasesWidget({super.key});

  @override
  State<NewReleasesWidget> createState() => _NewReleasesWidgetState();
}

class _NewReleasesWidgetState extends State<NewReleasesWidget> {
  late final NewReleasesViewModel newReleasesViewModel;

  @override
  void initState() {
    super.initState();
    newReleasesViewModel = NewReleasesViewModel();
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
              color: AppTheme.darkGreyColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: const Text(
                      'New Releases',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.whiteColor,
                      ),
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
                          padding: const EdgeInsets.all(8),
                          child: MovieImgHome(imgUrl: imgUrl),
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
