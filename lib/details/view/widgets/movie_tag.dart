import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';

class MovieTag extends StatelessWidget {
  const MovieTag(this.tag, {super.key});
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xff514F4F)),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: Text(
        tag,
        style: const TextStyle(color: AppTheme.whiteColor, fontSize: 10),
      )),
    );
  }
}
