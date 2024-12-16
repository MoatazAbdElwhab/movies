import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/service_locator.dart';
import 'package:movies/movie_details/view/screens/movie_details.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/widgets/favorite_button.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/shared/widgets/movie_watch_list_item.dart';
import 'package:movies/watch_list/view_model/watch_list_view_model.dart';
import 'package:provider/provider.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  void initState() {
    super.initState();
    ServiceLocator.watchListViewModel.getMoviesToWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Watch List',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 22),
            ),
          ),
          Expanded(child: Consumer<WatchListViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading) {
                return const LoadingIndicator();
              } else if (viewModel.movies.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/no_movies_found.png',
                        height: 87.h,
                        width: 78.h,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'No movies found',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 18.sp,
                                  color: AppTheme.whiteColor.withOpacity(0.8),
                                ),
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.separated(
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Stack(
                      children: [
                        InkWell(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MovieDetails(
                                    title: viewModel.movies[index].title,
                                    movieId: viewModel.movies[index].id,
                                  ),
                                )),
                            child: MovieWatchListItem(
                                movie: viewModel.movies[index])),
                        FavoriteButton(
                          movieFav: viewModel.movies[index],
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    color: AppTheme.grey1Color,
                  ),
                  itemCount: viewModel.movies.length,
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
