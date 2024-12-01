import 'package:flutter/material.dart';
import 'package:movies/features/home/view/widgets/new_releases_list.dart';
import '../widgets/top_side_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopSideWidget(),
            NewReleasesWidget(),
          ],
        ),
      ),
    );
  }
}
