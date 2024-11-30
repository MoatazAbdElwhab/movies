import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

class MovieDetailsSection extends StatelessWidget {
  const MovieDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .6,
      child: Column(
        children: [
          const Image(
            image: NetworkImage(
                'https://static1.srcdn.com/wordpress/wp-content/uploads/2019/08/Dora-and-the-Lost-City-of-Gold-Movie.jpg'),
            fit: BoxFit.fill,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dora and the lost city of gold',
                      style: TextStyle(color: AppTheme.whiteColor),
                    ),
                    Row(
                      children: [
                        Text(
                          '2019',
                          style: TextStyle(color: AppTheme.greyColor),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text('PG-13',
                            style: TextStyle(color: AppTheme.greyColor)),
                        SizedBox(
                          width: 12,
                        ),
                        Text('2h 7m',
                            style: TextStyle(color: AppTheme.greyColor)),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
