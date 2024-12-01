import 'package:flutter/material.dart';
import 'package:movies/details/view/widgets/movie_data_row.dart';
import 'package:movies/details/view/widgets/movie_rating_row.dart';
import 'package:movies/shared/app_theme.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 100,
        height: 180,
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
                    child: const Image(
                      image: NetworkImage(
                          'https://m.media-amazon.com/images/M/MV5BYjUwNjJmOGEtOGI0YS00ZjAyLWJjMTYtMjMzZjNhYWQxODY1XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),
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
            const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 6,
                      ),
                      MovieRatingRow(
                        iconSize: 12,
                        fontSize: 10,
                        rating: 6.8,
                        sizedBoxWidth: 4,
                      ),
                      Text(
                        'Ahmed',
                        style:
                            TextStyle(color: AppTheme.whiteColor, fontSize: 10),
                      ),
                      MovieDataRow(
                          fontSize: 8,
                          sizedBoxWidth: 4,
                          releaseDate: '2018',
                          pg: 'NC-17',
                          runTime: '2h 7m')
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
