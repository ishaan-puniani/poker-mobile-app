import 'dart:ui';

import 'package:flutter/material.dart';

class ColorPallete {
  static const Color darkRed = Color(0xFF5A0B0B);
  static const Color richRed = Color(0xFF1A0000);
  static const Color yellow = Color(0xFFF0C330);
  static const Color lightyellow = Color(0xFFFFF8D6);
  static const LinearGradient primarybgcolor = LinearGradient(
    colors: [Color(0xFF5A0B0B), Color(0xFF1A0000)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient yellowgradient = LinearGradient(
    colors: [Color(0xFFFFF8D6), Color(0xFFF0C330), Color(0xFFB8860B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
