import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';

class ResetPasswordComponent extends StatelessWidget {
  final int? height;
  final int? width;
  final double? spacebetweencomponents;
  final String? nextbuttontitle;
  final VoidCallback ontap;
  const ResetPasswordComponent({
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
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: AppIcon(AppIcons.lock, size: 20),
                    ),
                    backgroundColor: ColorPallete.brown,
                    hint: "create_new_password".tr,
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                      color: ColorPallete.textcolor,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: ColorPallete.borderyellow,
                      size: 16,
                    ),
                  ),

                  SizedBox(height: spacebetweencomponents ?? 12),
                  CustomTextField(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: AppIcon(AppIcons.lock, size: 20),
                    ),
                    backgroundColor: ColorPallete.brown,
                    hint: "confirm_password".tr,
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                      color: ColorPallete.textcolor,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: ColorPallete.borderyellow,
                      size: 16,
                    ),
                  ),

                  SizedBox(height: spacebetweencomponents ?? 12),
                  Row(
                    children: [
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
