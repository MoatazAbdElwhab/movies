import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/shared/utils/utils.dart';
import 'package:movies/watch_list/data/models/movie_fav.dart';
import '../api_constants.dart';
import '../app_theme.dart';
import 'loading_indicator.dart';

class MovieWatchListItem extends StatelessWidget {
  const MovieWatchListItem({
    super.key,
    required this.movie,
  });

  final MovieFav movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CachedNetworkImage(
            height: 100.h,
            width: 160.w,
            fit: BoxFit.cover,
            imageUrl: ApiConstants.imageBaseUrl +
                (movie.imgPath ?? 'assets/images/placeholder_image.jpg'),
            placeholder: (context, url) => const LoadingIndicator(),
            errorWidget: (context, url, error) => Image.asset(
              height: 89.h,
              width: 140.w,
              fit: BoxFit.cover,
              'assets/images/placeholder_image.jpg',
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                movie.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 15.sp),
              ),
              Text(
                extractYear(movie.date) ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 13.sp, color: AppTheme.greyColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}
