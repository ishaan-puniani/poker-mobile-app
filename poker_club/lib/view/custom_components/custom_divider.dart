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
        Container(
          // color: ColorPallete.yellow,
          width: 143.w,
          height: 1.h,
          decoration: BoxDecoration(gradient: ColorPallete.dividergradient),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(
            AppStrings.or.tr,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: ColorPallete.yellow,
              fontSize: 12.sp,
            ),
          ),
        ),
        Container(
          width: 143.w,
          decoration: BoxDecoration(gradient: ColorPallete.dividergradient),
          height: 1.h,
        ),
      ],
    );
  }
}
