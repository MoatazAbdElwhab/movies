import 'package:flutter/material.dart';
import 'package:movies/details/view/widgets/movie_details_section.dart';
import 'package:movies/details/view/widgets/similar_section.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        title: const Text(
          'Dora and the lost city of gold',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: const Column(
        children: [
          Expanded(flex: 2, child: MovieDetailsSection('558449')),
          Expanded(flex: 1, child: SimilarSection()),
        ],
      ),
    );
  }
}
