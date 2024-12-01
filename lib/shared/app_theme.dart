import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryDarkColor = Color(0xFF121312);
  static const Color goldColor = Color(0xFFFFA90A);
  static const Color greyColor = Color(0xFFB5B4B4);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color yellowColor = Color(0xFFF7B539);
  static const Color greyDarkColor = Color(0xFF1A1A1A);

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: primaryDarkColor,
    appBarTheme: const AppBarTheme(
        backgroundColor: greyDarkColor,
        titleTextStyle: TextStyle(color: whiteColor)),
    iconTheme: const IconThemeData(color: whiteColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: greyDarkColor,
      selectedItemColor: goldColor,
      unselectedItemColor: greyColor,
    ),
  );
}
