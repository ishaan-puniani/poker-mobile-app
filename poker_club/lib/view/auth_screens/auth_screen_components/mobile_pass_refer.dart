import 'dart:ui'; // IMPORTANT

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';

class MobilePassRefer extends StatelessWidget {
  const MobilePassRefer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10, // horizontal blur
            sigmaY: 10, // vertical blur
          ),
          child: Container(
            width: 380,
            height: 323,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: ColorPallete.borderyellow),
              color: Colors.black.withValues(
                alpha: 0.3,
              ), // IMPORTANT for glass effect
            ),
            child: Column(
              children: [
                CustomTextField(
                  backgroundColor: ColorPallete.brown,
                  hint: "enter_mobile_number".tr,
                ),
                CustomTextField(
                  backgroundColor: ColorPallete.brown,
                  hint: "create_password".tr,
                ),
                CustomTextField(
                  backgroundColor: ColorPallete.brown,
                  hint: "confirm_password".tr,
                ),
                CustomTextField(
                  backgroundColor: ColorPallete.brown,
                  hint: "enter_referral_code".tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
