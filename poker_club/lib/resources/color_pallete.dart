import 'package:flutter/material.dart';

class ColorPallete {
  static const Color darkRed = Color(0xFF5A0B0B);
  static const Color richRed = Color(0xFF1A0000);
  static const Color yellow = Color(0xFFF0C330);
  static const Color borderyellow = Color.fromRGBO(212, 175, 55, 1);
  static const Color textcolor = Color.fromRGBO(255, 255, 255, 0.6);
  static const Color darkTransparent = Color(0xB31A0000);
  static const LinearGradient borderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF79864), // rgba(247, 198, 100, 1)
      Color(0xFFC48A18), // rgba(196, 138, 24, 1)
      Color(0xFFA76D4A), // rgba(167, 109, 74, 1)
      Color(0xFF6C3B06), // rgba(108, 59, 6, 1)
      Color(0xFFD46A42), // rgba(212, 106, 66, 1)
      Color(0xFFC48A18), // rgba(196, 138, 24, 1)
    ],
  );
  static const Color goldLight = Color(0xFFEAD08D);
  static const Color brown = Color.fromRGBO(43, 26, 16, 0.8);
  static const Color transparent = Colors.transparent;
  static const Color buttonyellow = Color(0xd4af374d);
  static const Color redsnackbar = Color.fromRGBO(255, 103, 56, 0.15);
  static const Color lightyellow = Color(0xFFFFF8D6);
  static const Color lighteryellow = Color(0xFFFFF3B0);
  static const Color playasguest = Color.fromRGBO(191, 151, 109, 1);
  static const LinearGradient primarybgcolor = LinearGradient(
    colors: [Color(0xFF5A0B0B), Color(0xFF1A0000)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient redwarningtextgradient = LinearGradient(
    colors: [Color.fromRGBO(190, 58, 48, 1), Color.fromRGBO(224, 74, 62, 1)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient yellowgradient = LinearGradient(
    colors: [Color(0xFFFFF8D6), Color(0xFFF0C330), Color(0xFFB8860B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient rightbuttongradient = LinearGradient(
    colors: [
      Color.fromRGBO(246, 196, 83, 1),
      Color.fromRGBO(212, 175, 55, 1),
      Color.fromRGBO(184, 134, 11, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient logintoclaimgradient = LinearGradient(
    colors: [Color(0xFFFFD72D), Color(0xFFED8D29)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient dividergradient = LinearGradient(
    colors: [
      Color.fromRGBO(212, 175, 55, 0),
      Color.fromRGBO(212, 175, 55, 1),
      Color.fromRGBO(212, 175, 55, 0),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
