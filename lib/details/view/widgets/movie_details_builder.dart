import 'package:flutter/material.dart';
import 'package:movies/details/data/models/movie_details/movie_details_model.dart';
import 'package:movies/details/view/widgets/movie_data_row.dart';
import 'package:movies/details/view/widgets/movie_rating_row.dart';
import 'package:movies/details/view/widgets/movie_tag.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/utils/utils.dart';
import 'package:movies/shared/widgets/favorite_button.dart';

class MovieDetailsBuilder extends StatelessWidget {
  const MovieDetailsBuilder({
    super.key,
    required this.movie,
  });

  final MovieDetailsModel movie;

  @override
  Widget build(BuildContext context) {
    String backdropPath =
        'https://image.tmdb.org/t/p/original${movie.backdropPath}';
    String posterPath =
        'https://image.tmdb.org/t/p/original${movie.posterPath}';

    List<MovieTag> tags = movie.genres!
        .map(
          (e) => MovieTag(e.name!),
        )
        .toList();
    return Column(
      children: [
        Image(
          image: NetworkImage(backdropPath),
          fit: BoxFit.fill,
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * .2,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.originalTitle!,
                    style: const TextStyle(
                        color: AppTheme.whiteColor, fontSize: 18),
                  ),
                  MovieDataRow(
                    releaseDate: extractYear(movie.releaseDate) ?? '',
                    pg: movie.adult == null
                        ? 'R'
                        : movie.adult!
                            ? 'NC-17'
                            : 'PG-13',
                    runTime: minutesToHours(movie.runtime) ?? '?h ??m',
                    fontSize: 10,
                    sizedBoxWidth: 6,
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .3,
                    height: MediaQuery.sizeOf(context).height * .2,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: NetworkImage(posterPath),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .58,
                    height: MediaQuery.sizeOf(context).height * .2,
                    child: Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 8,
                            childAspectRatio: 3,
                          ),
                          itemBuilder: (context, index) => tags[index],
                          itemCount: tags.length,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          movie.overview!,
                          style: const TextStyle(
                              color: AppTheme.whiteColor, fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        MovieRatingRow(
                          rating: movie.voteAverage ?? 7.2,
                          fontSize: 18,
                          iconSize: 26,
                          sizedBoxWidth: 6,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
