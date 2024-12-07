import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryDarkColor = Color(0xFF121312);
  static const Color goldColor = Color(0xFFFFA90A);
  static const Color greyColor = Color(0xFFB5B4B4);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color yellowColor = Color(0xFFF7B539);
  static const Color dark1Color = Color(0xFF1A1A1A);
  static const Color darkLiverColor = Color(0xff514F4F);
  static const Color dark2Color = Color(0xff282A28);
  static const Color grey1Color = Color(0xff707070);

  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: primaryDarkColor,
    appBarTheme: const AppBarTheme(
      foregroundColor: whiteColor,
      backgroundColor: dark1Color,
      titleTextStyle: TextStyle(color: whiteColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: dark1Color,
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
