import 'package:flutter/material.dart';
import 'package:poker_club/resources/color_pallete.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: ColorPallete.darkRed,

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
