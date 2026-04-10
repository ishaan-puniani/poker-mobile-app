import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';

class CreateAccount extends StatelessWidget {
  final bool islogInPage;
  final String? title;
  final String? subtitle;
  const CreateAccount({
    super.key,
    required this.islogInPage,
    this.subtitle,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              ColorPallete.yellowgradient.createShader(bounds),

          child: Text(
            title ??
                (islogInPage
                    ? "login_account".tr.toUpperCase()
                    : "create_account".tr.toUpperCase()),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w800,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: .8), // ✅ 80% shadow
                  blurRadius: 50.r,
                  offset: Offset(2, 2),
                ),
              ],
              fontSize: 25.sp,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          subtitle ??
              (islogInPage
                  ? "welcome_back_to_the_table".tr
                  : "join_the_premium_poker_club".tr),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: .8),
                blurRadius: 50.r,
                offset: Offset(2, 2),
              ),
            ],
            fontSize: 13.sp,
            color: ColorPallete.goldLight,
          ),
        ),
        islogInPage == true
            ? Column(
                children: [
                  SizedBox(height: 8.h),
                  CustomButton(
                    width: 202.w,

                    height: 26,
                    prefixIcon: SvgPicture.asset(AppImages.logintoclaim),
                    radius: 20.r,
                    borderWidth: 1.w,

                    borderColor: ColorPallete.borderyellow.withValues(
                      alpha: 0.3,
                    ),
                    backgroundColor: ColorPallete.borderyellow.withValues(
                      alpha: 0.15,
                    ),
                    onPressed: () {},
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ColorPallete.yellow,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),

                    textGradient: ColorPallete.logintoclaimgradient,
                    text: "log_in_to_claim".tr,
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
