import 'package:flutter/material.dart';
import 'package:movies/movie_details/view/screens/movie_details.dart';
import 'package:movies/shared/api_constants..dart';
import 'package:movies/shared/models/movie_model.dart';
import 'package:movies/movie_details/view/widgets/movie_data_row.dart';
import 'package:movies/movie_details/view/widgets/movie_rating_row.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/utils/utils.dart';
import 'package:movies/shared/widgets/favorite_button.dart';
import 'package:movies/shared/widgets/movie_img_home.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    String posterPath = '${ApiConstants.imageBaseUrl}${movie.posterPath}';
    return Stack(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                MovieDetails(title: movie.title!, movieId: movie.id!),
          )),
          child: Container(
            width: 110,
            height: MediaQuery.sizeOf(context).height * 25,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppTheme.dark1Color,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 2, color: AppTheme.dark1Color),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.5),
                  blurRadius: 3,
                  offset: const Offset(0, 0),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: MovieImgHome(imgUrl: posterPath),
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
                            maxLines: 1,
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
        ),
        FavoriteButton(),
      ],
    );
  }
}
