import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:poker_club/resources/color_pallete.dart';

class CreateAccount extends StatelessWidget {
  final bool islogInPage;
  const CreateAccount({super.key, required this.islogInPage});

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
            islogInPage
                ? "login_account".tr.toUpperCase()
                : "create_account".tr.toUpperCase(),
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
          islogInPage
              ? "welcome_back_to_the_table".tr
              : "join_the_premium_poker_club".tr,
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
      ],
    );
  }
}
