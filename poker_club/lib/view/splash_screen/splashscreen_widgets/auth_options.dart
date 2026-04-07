import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/resources/strings.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 4.h),
        CustomButton(
          width: 202.w,

          height: 26.h,
          prefixIcon: SvgPicture.asset(AppImages.logintoclaim),
          radius: 20.r,
          borderWidth: 1.w,

          borderColor: ColorPallete.yellow.withAlpha(30),
          backgroundColor: ColorPallete.yellow.withAlpha(15),
          onPressed: () {},
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ColorPallete.yellow,
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
          ),

          textGradient: ColorPallete.logintoclaimgradient,
          text: "Log in to claim 100 chips",
        ),
        SizedBox(height: 25.h),
        Row(
          children: [
            Flexible(
              child: CustomButton(onPressed: () {}, text: AppStrings.signUp.tr),
            ),
            Expanded(
              child: CustomButton(onPressed: () {}, text: AppStrings.logIn.tr),
            ),
          ],
        ),
      ],
    );
  }
}
