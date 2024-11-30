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
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: HomeScreen.routeName,
    );
  }
}