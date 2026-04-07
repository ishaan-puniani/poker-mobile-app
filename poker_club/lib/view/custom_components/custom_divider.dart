import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/strings.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 143.w, color: ColorPallete.yellow, height: 1.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            AppStrings.or.tr,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorPallete.yellow,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
        ),
        Container(width: 143.w, color: ColorPallete.yellow, height: 1.h),
      ],
    );
  }
}
