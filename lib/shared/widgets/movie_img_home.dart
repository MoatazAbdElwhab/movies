import 'package:flutter/material.dart';
import 'package:movies/shared/widgets/favorite_button.dart';

class MovieImgHome extends StatelessWidget {
  const MovieImgHome({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            'assets/images/film_picture.png',
            height: size.height * 0.22,
            width: size.width * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        FavoriteButton(),
      ],
    );
  }
}
