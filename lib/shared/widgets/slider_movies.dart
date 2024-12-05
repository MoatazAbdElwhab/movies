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
      color: AppTheme.darkGreyColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 15),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 12),
                child: MovieItem(
                  movie: movies![index],
                ),
              ),
              itemCount: movies!.length,
            ),
          ),
        ],
      ),
    );
  }
}
