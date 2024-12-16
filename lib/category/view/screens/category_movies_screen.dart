import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/category/data/models/category_item_model.dart';
import 'package:movies/category/view_model/category_view_model.dart';
import 'package:movies/movie_details/view/screens/movie_details.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/widgets/favorite_button.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/shared/widgets/movie_search_item.dart';
import 'package:movies/watch_list/data/models/movie_fav.dart';
import 'package:provider/provider.dart';

class CategoryMoviesScreen extends StatelessWidget {
  const CategoryMoviesScreen({
    super.key,
    required this.categoryItemModel,
  });

  final CategoryItemModel categoryItemModel;

  @override
  Widget build(BuildContext context) {
    final viewModel = CategoryViewModel()
      ..getMoviesByCategoryId(categoryItemModel.id.toString());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppTheme.whiteColor,
                        )),
                    Text(
                      categoryItemModel.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 22),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ChangeNotifierProvider(
                create: (context) => viewModel,
                child: Consumer<CategoryViewModel>(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          child: Stack(
                            children: [
                              InkWell(
                                  onTap: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => MovieDetails(
                                          title: viewModel.movies[index].title!,
                                          movieId: viewModel.movies[index].id!,
                                        ),
                                      )),
                                  child: MovieSearchItem(
                                      movie: viewModel.movies[index])),
                              FavoriteButton(
                                movieFav: MovieFav(
                                  id: viewModel.movies[index].id!,
                                  title: viewModel.movies[index].title!,
                                  date: viewModel.movies[index].releaseDate!,
                                  imgPath: viewModel.movies[index].posterPath!,
                                ),
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
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
