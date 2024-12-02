import 'package:flutter/material.dart';
import 'package:movies/movie_details/view/widgets/movie_details_section.dart';
import 'package:movies/movie_details/view/widgets/similar_section.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    super.key,
    required this.title,
    required this.movieId,
  });
  final String title;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailsSection('$movieId'),
            const SizedBox(height: 24),
            SimilarSection('$movieId'),
          ],
        ),
      ),
    );
  }
}
