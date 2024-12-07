import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../movie_details/view/screens/movie_details.dart';
import '../../../shared/app_theme.dart';
import '../../../shared/widgets/error_indicator.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../../view_model/search_view_model.dart';
import '../../../shared/widgets/movie_search_item.dart';
import '../widgets/search_text_field.dart';
import '../../../shared/utils/validator.dart'; // Import Validator

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late final SearchViewModel viewModel;

  @override
  void dispose() {
    super.dispose();
    viewModel.clearSearchMovies();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<SearchViewModel>(context, listen: false);
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 30.w,
        end: 30.w,
        top: 40.h,
        bottom: 25.h,
      ),
      child: Column(
        children: [
          SearchTextField(
            onSubmitted: (value) {
              if (!Validator.isNotEmpty(value)) {
                viewModel.clearSearchMovies(icon: true);
              }
            },
            controller: controller,
            clearOnPressed: () {
              controller.clear();
              viewModel.clearSearchMovies(icon: true);
            },
            onChanged: (value) {
              if (Validator.isNotEmpty(value)) {
                viewModel.getSearchMovies(value);
              } else {
                viewModel.clearSearchMovies(icon: true);
              }
            },
            onSearchPressed: () {
              final query = controller.text.trim();
              if (Validator.isNotEmpty(query)) {
                viewModel.getSearchMovies(query);
              }
            },
          ),
          Expanded(
            child: Consumer<SearchViewModel>(
              builder: (_, searchViewModel, __) {
                if (searchViewModel.isLoading) {
                  return const LoadingIndicator();
                } else if (searchViewModel.errorMessage != null) {
                  return ErrorIndicator(searchViewModel.errorMessage!);
                } else if (searchViewModel.movies.isEmpty) {
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
                }
                return ListView.separated(
                  itemCount: searchViewModel.movies.length,
                  separatorBuilder: (_, __) => Divider(
                    color: AppTheme.grey1Color,
                    height: 1.h,
                  ),
                  itemBuilder: (context, index) {
                    final movie = searchViewModel.movies[index];
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MovieDetails(
                                title: movie.title!,
                                movieId: movie.id!,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, left: 5.w, bottom: 17.h),
                          child: MovieSearchItem(movie: movie),
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
