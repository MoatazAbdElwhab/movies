import 'package:flutter/material.dart';
import 'package:movies/home/view/screens/home_tab.dart';
import 'package:movies/search/view/screens/search_tab.dart';
import 'package:movies/search/view_model/search_view_model.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/watch_list/view/screens/watch_list_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const Center(
        child: Text(
      'Browse',
      style: TextStyle(color: AppTheme.whiteColor),
    )),
    const WatchListScreen(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(),
      child: Scaffold(
        body: SafeArea(
          child: tabs[selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Browse',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Watchlist',
            ),
          ],
        ),
      ),
    );
  }
}
