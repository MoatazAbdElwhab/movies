import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/shared/widgets/error_indicator.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../shared/api_constants.dart';
import '../../view_model/top_rated_view_model.dart';

class TopSideWidget extends StatefulWidget {
  const TopSideWidget({super.key});

  @override
  State<TopSideWidget> createState() => _TopSideWidgetState();
}

class _TopSideWidgetState extends State<TopSideWidget> {
  late final TopRatedViewModel topRatedViewModel;

  @override
  void initState() {
    super.initState();
    topRatedViewModel = TopRatedViewModel();
    topRatedViewModel
        .getTopRatedMovies(); // Fetch movies when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<TopRatedViewModel>(
      create: (_) => topRatedViewModel,
      child: Consumer<TopRatedViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(viewModel.errorMessage!);
          } else if (viewModel.movies.isEmpty) {
            return ErrorIndicator(viewModel.errorMessage!);
          } else {
            return CarouselSlider.builder(
              itemCount: viewModel.movies.length,
              itemBuilder: (context, index, realIndex) {
                final movie = viewModel.movies[index];
                return Stack(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: screenHeight * 0.35,
                        child: CachedNetworkImage(
                          imageUrl:
                              ApiConstants.imageBaseUrl + movie.posterPath!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const LoadingIndicator(),
                          // Show while loading
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/placeholder_image.jpg',
                            fit: BoxFit.fill,
                          ), // Show on error,
                        )),
                    Positioned(
                      left: screenWidth * 0.42,
                      top: screenHeight * 0.13,
                      child: Image.asset('assets/images/play-button-2.png'),
                    ),
                    Positioned(
                      left: screenWidth * 0.03,
                      top: screenHeight * 0.14,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.3,
                            height: screenHeight * 0.25,
                            child: CachedNetworkImage(
                              imageUrl: ApiConstants.imageBaseUrl +
                                  movie.backdropPath!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const LoadingIndicator(),
                              // Show while loading
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/images/placeholder_image.jpg',
                                fit: BoxFit.fill,
                              ), // Show on error,
                            ),
                          ),
                          Image.asset('assets/images/bookmark.png'),
                        ],
                      ),
                    ),
                    PositionedDirectional(
                      start: screenWidth * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight * 0.36),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(end: 20.0),
                            child: Text(
                              movie.title!,
                              style: Theme.of(context).textTheme.titleMedium!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(movie.releaseDate!,
                              style: Theme.of(context).textTheme.bodySmall!),
                        ],
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                height: screenHeight * 0.5,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayCurve: Curves.easeInOut,
                autoPlayAnimationDuration: const Duration(seconds: 1),
              ),
            );
          }
        },
      ),
    );
  }
}
