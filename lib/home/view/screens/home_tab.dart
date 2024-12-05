import 'package:flutter/material.dart';
import 'package:movies/home/view/widgets/recomended_item.dart';
import 'package:movies/release/view/widgets/new_releases_widget.dart';
import '../widgets/top_side_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TopSideWidget(),
          NewReleasesWidget(),
          SizedBox(height: 24),
          RecomendedItem(),
        ],
      ),
    );
  }
}
