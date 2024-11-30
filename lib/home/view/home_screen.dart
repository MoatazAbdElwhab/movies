import 'package:flutter/material.dart';
import 'package:movies/details/view/screens/movie_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {

    return const MovieDetails();

  }
}
