import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

class MovieRatingRow extends StatelessWidget {
  const MovieRatingRow({
    super.key,
    required this.iconSize,
    required this.fontSize,
    required this.rating,
    required this.sizedBoxWidth,
  });

  // final MovieDetailsModel? movie;
  final double iconSize;
  final double sizedBoxWidth;

  final double fontSize;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: AppTheme.goldColor,
          size: iconSize,
        ),
        SizedBox(
          width: sizedBoxWidth,
        ),
        Text(
          rating.toString(),
          style: TextStyle(fontSize: fontSize, color: AppTheme.whiteColor),
        )
      ],
    );
  }
}
