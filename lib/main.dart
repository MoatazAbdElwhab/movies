import 'package:flutter/material.dart';
import 'package:movies/home/view/home_screen.dart';
import 'package:movies/shared/app_theme.dart';

void main() {
  runApp(const Movies());
}

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      theme: AppTheme.theme,
      initialRoute: HomeScreen.routeName,
    );
  }
}