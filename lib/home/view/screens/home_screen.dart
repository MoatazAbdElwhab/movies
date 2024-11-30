import 'package:flutter/material.dart';
import 'package:movies/features/home/view/screens/home_tab.dart';
import 'package:movies/shared/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
   const HomeTab(),
    const Center(
        child: Text(
      'Search',
      style: TextStyle(color: AppTheme.whiteColor),
    )),
    const Center(
        child: Text(
      'Browse',
      style: TextStyle(color: AppTheme.whiteColor),
    )),
    const Center(
        child: Text(
      'Watchlist',
      style: TextStyle(color: AppTheme.whiteColor),
    )),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
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
    );
  }
}
