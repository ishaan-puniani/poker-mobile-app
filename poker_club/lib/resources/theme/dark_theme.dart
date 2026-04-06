import 'package:flutter/material.dart';
import 'package:poker_club/resources/color_pallete.dart';

class DarkTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: ColorPallete.darkRed,

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
