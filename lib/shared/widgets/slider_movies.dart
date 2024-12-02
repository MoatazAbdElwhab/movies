import 'package:flutter/material.dart';
import 'package:movies/movie_details/view/widgets/movie_item.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/models/movie_model.dart';

class SliderMovies extends StatelessWidget {
  const SliderMovies({
    super.key,
    required this.movies,
    required this.title,
  });
  final String title;
  final List<MovieModel>? movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .27,
      padding: const EdgeInsetsDirectional.only(start: 20, top: 10),
      color: AppTheme.greyDarkColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => MovieItem(
                movie: movies![index],
              ),
              itemCount: movies!.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
