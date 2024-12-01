import 'package:flutter/material.dart';
import 'package:movies/details/view/widgets/movie_item.dart';
import 'package:movies/shared/app_theme.dart';

class SimilarSection extends StatelessWidget {
  const SimilarSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<MovieItem> movies = List.generate(
      8,
      (index) => const MovieItem(),
    );
    return SafeArea(
      bottom: true,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: AppTheme.greyDarkColor,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'More Like This',
                style: TextStyle(color: AppTheme.whiteColor),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => movies[index],
                itemCount: movies.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
