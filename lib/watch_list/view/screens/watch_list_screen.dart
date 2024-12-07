import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/models/movie_model.dart';
import 'package:movies/shared/widgets/favorite_button.dart';
import 'package:movies/shared/widgets/movie_search_item.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  List<MovieModel> movies = List.generate(
    10,
    (index) => MovieModel(
      adult: false,
      backdropPath: "/dvBCdCohwWbsP5qAaglOXagDMtk.jpg",
      genreIds: [28, 35, 878],
      id: 533535,
      originalLanguage: "en",
      originalTitle: "Deadpool & Wolverine",
      overview:
          "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
      popularity: 880.666,
      posterPath: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
      releaseDate: "2024-07-24",
      title: "Deadpool & Wolverine",
      video: false,
      voteAverage: 7.678,
      voteCount: 5783,
    ),
  );
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
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Stack(children: [
                        MovieSearchItem(movie: movies[index]),
                        FavoriteButton(
                          isFavorite: true,
                        ),
                      ]),
                    ),
                separatorBuilder: (context, index) => const Divider(
                      color: AppTheme.grey1Color,
                    ),
                itemCount: movies.length),
          )
        ],
      ),
    );
  }
}
