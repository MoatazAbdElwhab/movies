import 'package:flutter/material.dart';
import 'package:movies/core/service_locator.dart';
import 'package:movies/watch_list/data/models/movie_fav.dart';

class FavoriteButton extends StatefulWidget {
  final MovieFav movieFav;
  const FavoriteButton({
    super.key,
    required this.movieFav,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final watchListViewModel = ServiceLocator.watchListViewModel;
  late bool isFavorite;
  @override
  void initState() {
    super.initState();
    isFavorite = watchListViewModel.movies.any(
      (movieFav) => movieFav.id == widget.movieFav.id,
    );
  }

  @override
  void didUpdateWidget(covariant FavoriteButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('test');
    isFavorite = watchListViewModel.movies.any(
      (movieFav) => movieFav.id == widget.movieFav.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isFavorite) {
          watchListViewModel.removeMovieToWatchList(widget.movieFav);
        } else {
          watchListViewModel.addMovieToWatchList(widget.movieFav);
        }
        isFavorite = !isFavorite;
        setState(() {});
      },
      child: Stack(
        children: [
          Image.asset(isFavorite
              ? 'assets/images/Icon-bookmark-gold.png'
              : 'assets/images/Icon-bookmark.png'),
          PositionedDirectional(
            top: 3,
            start: 2,
            child: Icon(
              isFavorite ? Icons.done : Icons.add,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
