import 'package:flutter/material.dart';
import '../widgets/top_side_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopSideWidget(),
          ],
        ),
      ),
    );
  }
}
