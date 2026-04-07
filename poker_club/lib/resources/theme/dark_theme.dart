import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/resources/color_pallete.dart';

class DarkTheme {
  static ThemeData get theme {
    final base = ThemeData.dark();

    return base.copyWith(
      brightness: Brightness.dark,

      scaffoldBackgroundColor: ColorPallete.darkRed,

      // 🔥 Apply Inter globally
      textTheme: GoogleFonts.interTextTheme(base.textTheme),
      primaryTextTheme: GoogleFonts.interTextTheme(base.primaryTextTheme),

      // // Optional but recommended for consistency
      // fontFamily: GoogleFonts.inter().fontFamily,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorPallete.darkRed,
        elevation: 0,
        centerTitle: true,
      ),

      colorScheme: const ColorScheme.dark(
        primary: ColorPallete.darkRed,
        secondary: ColorPallete.richRed,
      ),
    );
  }
}
