import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poker_club/resources/color_pallete.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  const FormContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 110, // horizontal blur
          sigmaY: 110, // vertical blur
        ),
        child: Container(
          width: 380,
          // height: islogInPage ? 286 : 323,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: ColorPallete.borderyellow),
            color: Colors.black.withValues(
              alpha: 0.3,
            ), // IMPORTANT for glass effect
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16).r,
          child: child,
        ),
      ),
    );
  }
}
