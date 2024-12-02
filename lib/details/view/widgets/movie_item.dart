import 'package:flutter/material.dart';
import 'package:movies/details/data/models/movie_similar/similar_movie.dart';
import 'package:movies/details/view/widgets/movie_data_row.dart';
import 'package:movies/details/view/widgets/movie_rating_row.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/utils/utils.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final SimilarMovie movie;
  @override
  Widget build(BuildContext context) {
    String posterPath =
        'https://image.tmdb.org/t/p/original${movie.posterPath}';
    return SingleChildScrollView(
      child: Container(
        width: 110,
        height: 190,
        decoration: BoxDecoration(
          color: AppTheme.greyDarkColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 2, color: AppTheme.greyDarkColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.5),
              blurRadius: 8,
              offset: const Offset(5, 5),
              spreadRadius: .3,
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              flex: 2,
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
                  Positioned(
                    top: -13,
                    left: -17,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_add,
                          size: 40,
                          color: AppTheme.greyColor,
                        )),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      MovieRatingRow(
                        iconSize: 12,
                        fontSize: 10,
                        rating: movie.voteAverage ?? 0.0,
                        sizedBoxWidth: 4,
                      ),
                      Text(
                        movie.originalTitle ?? 'no title',
                        style: const TextStyle(
                            color: AppTheme.whiteColor, fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      MovieDataRow(
                        fontSize: 8,
                        sizedBoxWidth: 4,
                        releaseDate: extractYear(movie.releaseDate) ?? '',
                        pg: movie.adult == null
                            ? 'R'
                            : movie.adult!
                                ? 'PG-13'
                                : 'NC-17',
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
