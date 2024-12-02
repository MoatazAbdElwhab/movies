import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

class MovieDataRow extends StatelessWidget {
  const MovieDataRow({
    super.key,
    // this.movie,
    required this.fontSize,
    required this.sizedBoxWidth,
    required this.releaseDate,
    required this.pg,
    this.runTime,
  });

  final double fontSize;
  final double sizedBoxWidth;
  final String releaseDate;
  final String pg;
  final String? runTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          releaseDate,
          style: TextStyle(color: AppTheme.greyColor, fontSize: fontSize),
        ),
        SizedBox(
          width: sizedBoxWidth,
        ),
        Text(pg,
            style: TextStyle(color: AppTheme.greyColor, fontSize: fontSize)),
        SizedBox(
          width: sizedBoxWidth,
        ),
        Text(runTime ?? '',
            style: TextStyle(color: AppTheme.greyColor, fontSize: fontSize)),
      ],
    );
  }
}
