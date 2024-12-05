import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/shared/widgets/favorite_button.dart';
import 'package:movies/shared/widgets/loading_indicator.dart';

class MovieImgHome extends StatelessWidget {
  final String imgUrl;
  const MovieImgHome({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        placeholder: (context, __) => const LoadingIndicator(),
        errorWidget: (context, _, __) =>
            const Icon(Icons.image_not_supported_outlined),
        height: size.height * 0.22,
        width: size.width * 0.26,
        fit: BoxFit.fill,
      ),
    );
  }
}
