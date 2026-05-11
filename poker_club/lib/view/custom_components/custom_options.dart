import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';

class CustomOptions extends StatelessWidget {
  final int? height;
  final int? width;
  final double? spacebetweencomponents;
  final String? nextbuttontitle;
  final VoidCallback ontap;
  const CustomOptions({
    super.key,
    this.height,
    this.width,
    this.nextbuttontitle,
    this.spacebetweencomponents,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 110, // horizontal blur
            sigmaY: 110, // vertical blur
          ),
          child: Container(
            width: 380,
            // height:   286 : 323,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: ColorPallete.borderyellow),
              color: Colors.black.withValues(
                alpha: 0.3,
              ), // IMPORTANT for glass effect
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                      color: ColorPallete.textcolor,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: AppIcon(AppIcons.mobile, size: 20),
                    ),
                    backgroundColor: ColorPallete.brown,
                    hint: "enter_mobile_number".tr,
                  ),
                  SizedBox(height: spacebetweencomponents ?? 12),
                  // CustomTextField(
                  //   hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  //     fontWeight: FontWeight.w700,
                  //     fontSize: 13.sp,
                  //     color: ColorPallete.textcolor,
                  //   ),
                  //   prefixIcon: Padding(
                  //     padding: EdgeInsets.all(8.w),
                  //     child: AppIcon(AppIcons.lock, size: 20),
                  //   ),
                  //   backgroundColor: ColorPallete.brown,
                  //   hint: "confirm_password".tr,
                  //   suffixIcon: Icon(
                  //     Icons.remove_red_eye,
                  //     color: ColorPallete.borderyellow,
                  //     size: 16,
                  //   ),
                  // ),
                  // SizedBox(height: spacebetweencomponents ?? 12),
                  // CustomTextField(
                  //   prefixIcon: Padding(
                  //     padding: EdgeInsets.all(8.w),
                  //     child: AppIcon(AppIcons.gift, size: 20),
                  //   ),
                  //   backgroundColor: ColorPallete.brown,
                  //   hint: "enter_referral_code".tr,
                  //   hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  //     fontWeight: FontWeight.w700,
                  //     fontSize: 13.sp,
                  //     color: ColorPallete.textcolor,
                  //   ),
                  //   suffixIcon: Container(
                  //     width: 80,
                  //     child: Center(
                  //       child: Text(
                  //         "optional".tr,
                  //         textAlign: TextAlign.center,
                  //         style: Theme.of(context).textTheme.bodyMedium
                  //             ?.copyWith(
                  //               fontWeight: FontWeight.w500,
                  //               fontSize: 12.sp,
                  //               color: ColorPallete.textcolor,
                  //             ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: spacebetweencomponents ?? 12),
                  Row(
                    children: [
                      // Expanded(
                      //   child: CustomButton(
                      //     borderColor: ColorPallete.borderyellow,
                      //     backgroundColor: ColorPallete.brown,

                      //     radius: 12.r,
                      //     width: 164,
                      //     height: 36,
                      //     suffixIcon: AppIcon(AppIcons.google, size: 16),
                      //     onPressed: () {},
                      //     text: "continue_with".tr.toUpperCase(),
                      //     textStyle: Theme.of(context).textTheme.titleMedium
                      //         ?.copyWith(
                      //           fontWeight: FontWeight.w700,
                      //           fontSize: 13.sp,
                      //         ),
                      //   ),
                      // ),
                      // SizedBox(width: 10.w),
                      Expanded(
                        child: CustomButton(
                          backgroundGradient: ColorPallete.rightbuttongradient,
                          textStyle: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: ColorPallete.brown,
                                fontWeight: FontWeight.w700,
                                fontSize: 13.sp,
                              ),
                          radius: 12.r,
                          width: 164,
                          height: 36,

                          onPressed: ontap,
                          text: (nextbuttontitle ?? "continue").tr
                              .toUpperCase(),
                        ),
                      ),
                    ],
                  ),

                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: CustomButton(
                  //         borderColor: ColorPallete.borderyellow,
                  //         backgroundColor: ColorPallete.transparent,

                  //         radius: 12.r,
                  //         width: 164,
                  //         height: 36,

                  //         onPressed: () {},
                  //         text: "login_with_otp".tr,
                  //         textStyle: Theme.of(context).textTheme.titleMedium
                  //             ?.copyWith(
                  //               fontWeight: FontWeight.w600,
                  //               fontSize: 13.sp,
                  //               color: ColorPallete.playasguest,
                  //             ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
