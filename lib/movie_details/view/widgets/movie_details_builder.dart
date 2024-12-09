import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/movie_details/data/models/movie_details/movie_details_model.dart';
import 'package:movies/movie_details/view/widgets/movie_data_row.dart';
import 'package:movies/movie_details/view/widgets/movie_rating_row.dart';
import 'package:movies/movie_details/view/widgets/movie_tag.dart';
import 'package:movies/shared/api_constants..dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/utils/utils.dart';
import 'package:movies/shared/widgets/favorite_button.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';
import 'package:movies/watch_list/data/models/movie_fav.dart';

class MovieDetailsBuilder extends StatelessWidget {
  const MovieDetailsBuilder({
    super.key,
    required this.movie,
  });

  final MovieDetailsModel movie;

  @override
  Widget build(BuildContext context) {
    String backdropPath = '${ApiConstants.imageBaseUrl}${movie.backdropPath}';
    String posterPath = '${ApiConstants.imageBaseUrl}${movie.posterPath}';

    List<MovieTag> tags = movie.genres!
        .map(
          (e) => MovieTag(e.name!),
        )
        .toList();
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: backdropPath,
          placeholder: (context, url) => const LoadingIndicator(),
          errorWidget: (context, url, error) =>
              const Icon(Icons.image_not_supported_outlined),
          fit: BoxFit.cover,
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * .2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.originalTitle!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 18),
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
                    height: MediaQuery.sizeOf(context).height * .25,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            imageUrl: posterPath,
                            placeholder: (context, url) =>
                                const LoadingIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.image_not_supported_outlined),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        FavoriteButton(
                          movieFav: MovieFav(
                            id: movie.id!,
                            title: movie.title!,
                            date: movie.releaseDate!,
                            imgPath: movie.posterPath!,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .58,
                    height: MediaQuery.sizeOf(context).height * .25,
                    child: Column(
                      children: [
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 4,
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
                          maxLines: 3,
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
