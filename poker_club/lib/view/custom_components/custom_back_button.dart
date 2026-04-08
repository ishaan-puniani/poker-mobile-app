import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:poker_club/resources/color_pallete.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback back;
  const CustomBackButton({super.key, required this.back});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: back,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: ColorPallete.darkTransparent,
          border: GradientBoxBorder(
            gradient: ColorPallete.borderGradient, // 👈 your gradient
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_rounded,
            size: 12.w,
            color: ColorPallete.borderyellow,
          ),
        ),
      ),
    );
  }
}
