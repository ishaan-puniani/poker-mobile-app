import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/resources/color_pallete.dart';

class LightTheme {
  static ThemeData get theme {
    final base = ThemeData.light();

    final textTheme = GoogleFonts.interTextTheme(base.textTheme);

    return base.copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorPallete.darkRed,

      textTheme: textTheme.copyWith(
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.inter(fontWeight: FontWeight.w600),
        titleMedium: GoogleFonts.inter(fontWeight: FontWeight.w700),
      ),

      primaryTextTheme: textTheme,

      appBarTheme: const AppBarTheme(
        backgroundColor: ColorPallete.darkRed,
        elevation: 0,
        centerTitle: true,
      ),

      colorScheme: const ColorScheme.light(
        primary: ColorPallete.darkRed,
        secondary: ColorPallete.richRed,
      ),
    );
  }
}
