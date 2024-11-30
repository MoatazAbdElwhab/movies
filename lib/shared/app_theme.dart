import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryDarkColor = Color(0xFF121312);
  static const Color goldColor = Color(0xFFFFA90A);
  static const Color greyColor = Color(0xFFB5B4B4);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color yellowColor = Color(0xFFF7B539);
  static const Color greyDarkColor = Color(0xFF1A1A1A);

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: primaryDarkColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: greyDarkColor,
      selectedItemColor: goldColor,
      unselectedItemColor: greyColor,
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.inter(
          fontSize: 16, fontWeight: FontWeight.w400, color: whiteColor),
      bodySmall: GoogleFonts.inter(
          fontSize: 10, fontWeight: FontWeight.w400, color: greyColor),
    ),
  );
}
