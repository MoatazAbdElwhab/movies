import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryDarkColor = Color(0xFF121312);
  static const Color goldColor = Color(0xFFFFBB3B);
  static const Color greyColor = Color(0xFFB5B4B4);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color yellowColor = Color(0xFFF7B539);
  static const Color darkGray = Color(0xFF1d1e1d);

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: primaryDarkColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: darkGray,
        titleTextStyle: TextStyle(color: whiteColor)),
    iconTheme: const IconThemeData(color: whiteColor),
  );
}
