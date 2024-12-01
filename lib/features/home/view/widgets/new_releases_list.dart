import 'package:flutter/material.dart';
import 'package:movies/features/home/view_model/new_releases_view_model.dart';
import 'package:movies/shared/api_constants.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    return ChangeNotifierProvider<NewReleasesViewModel>(
      create: (_) => newReleasesViewModel,
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
              decoration: BoxDecoration(
                color: AppTheme.greyDarkColor,
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Releases',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.newReleases.length,
                      itemBuilder: (context, index) {
                        final movie = viewModel.newReleases[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                imageUrl: ApiConstants.imageBaseUrl +
                                    (movie.posterPath ?? ''),
                                width: 110,
                                height: 140,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const LoadingIndicator(),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  'assets/images/placeholder_image.jpg',
                                ),
                              ),
                            ],
                          ),
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
