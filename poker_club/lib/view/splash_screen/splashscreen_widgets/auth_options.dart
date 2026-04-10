import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/resources/strings.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/custom_components/custom_divider.dart';

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

          height: 26,
          prefixIcon: SvgPicture.asset(AppImages.logintoclaim),
          radius: 20.r,
          borderWidth: 1.w,

          borderColor: ColorPallete.borderyellow.withValues(alpha: 0.15),
          backgroundColor: ColorPallete.borderyellow.withValues(alpha: 0.30),
          onPressed: () {},
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ColorPallete.yellow,
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
          ),

          textGradient: ColorPallete.logintoclaimgradient,
          text: "log_in_to_claim".tr,
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              height: 36,
              radius: 12.r,
              borderWidth: 1.w,
              borderColor: ColorPallete.yellow,
              backgroundColor: ColorPallete.brown,
              width: 158.w,
              onPressed: () {
                //checkmark: go to sign up screen
                Get.toNamed(AppRoutes.login);
              },
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorPallete.lighteryellow,
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
              text: AppStrings.signUp.tr,
            ),
            SizedBox(width: 13.w),
            CustomButton(
              boxShadow: [],
              backgroundGradient: ColorPallete.rightbuttongradient,
              radius: 12.r,
              width: 158.w,
              height: 36,
              textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorPallete.brown,
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.login);
              },
              text: "login".tr,
            ),
          ],
        ),
        SizedBox(height: 13),
        CustomDivider(),
        SizedBox(height: 13),
        CustomButton(
          height: 36,
          radius: 12.r,
          borderWidth: 1.w,
          borderColor: ColorPallete.playasguest,
          backgroundColor: ColorPallete.transparent,
          width: 329.w,
          onPressed: () {},
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: ColorPallete.playasguest,
            fontSize: 13.sp,
          ),
          text: "play_as_guest".tr,
        ),
      ],
    );
  }
}
