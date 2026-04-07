import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/resources/color_pallete.dart';

class LightTheme {
  static ThemeData get theme {
    final base = ThemeData.light();

    return base.copyWith(
      brightness: Brightness.light,

      // ⚠️ Better use light background instead of darkRed
      scaffoldBackgroundColor: ColorPallete.darkRed,

      // 🔥 Apply Inter font globally
      textTheme: GoogleFonts.interTextTheme(base.textTheme),
      primaryTextTheme: GoogleFonts.interTextTheme(base.primaryTextTheme),

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
