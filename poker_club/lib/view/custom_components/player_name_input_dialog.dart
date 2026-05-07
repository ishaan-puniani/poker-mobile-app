import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';

class PlayerNameInputDialog extends StatelessWidget {
  const PlayerNameInputDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            right: 26.w,
            bottom: 0,
            child: Image.asset(AppImages.characterCasinoDealer),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 360.w,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              decoration: BoxDecoration(
                gradient: ColorPallete.primarybgcolor,
                border: Border.all(
                  color: Colors.yellow.withValues(alpha: 0.8),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What\'s your name?',
                    style: TextStyle(
                      color: Colors.yellow.shade700,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  CustomTextField(
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                      color: ColorPallete.textcolor,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: AppIcon(AppIcons.person, size: 20.r),
                    ),
                    backgroundColor: ColorPallete.brown,
                    hint: "enter_your_name".tr,
                    height: 36.h,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Don't worry, you can change this later.",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    onPressed: () {
                      // Handle continue action
                      Get.back();
                    },
                    text: "continue".tr.toUpperCase(),
                    width: double.infinity,
                    height: 26.h,
                    backgroundColor: ColorPallete.yellow,
                    textStyle: TextStyle(
                      color: ColorPallete.darkTransparent,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    radius: 24.r,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
