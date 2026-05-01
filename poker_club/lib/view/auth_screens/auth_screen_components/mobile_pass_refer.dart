import 'dart:ui'; // IMPORTANT

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';

class MobilePassRefer extends StatelessWidget {
  final bool islogInPage;

  final double? spacebetweencomponents;
  const MobilePassRefer({
    super.key,
    required this.islogInPage,
    this.spacebetweencomponents,
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
            height: islogInPage ? 286 : 323,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: ColorPallete.borderyellow),
              color: Colors.black.withValues(
                alpha: 0.3,
              ), // IMPORTANT for glass effect
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: spacebetweencomponents ?? 20),
                  CustomTextField(
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                      color: ColorPallete.textcolor,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: SvgPicture.asset(
                        AppImages.mobile,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    backgroundColor: ColorPallete.brown,
                    hint: "enter_mobile_number".tr,
                  ),

                  SizedBox(height: spacebetweencomponents ?? 12),
                  if (islogInPage == true)
                    Column(
                      children: [
                        CustomTextField(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: SvgPicture.asset(
                              AppImages.lock,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          backgroundColor: ColorPallete.brown,
                          hint: "enter_the_password".tr,
                          hintStyle: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
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
                      ],
                    ),
                  if (islogInPage == true)
                    Column(
                      children: [
                        SizedBox(height: spacebetweencomponents ?? 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.forgotpassword);
                              },
                              child: Text("forgot_password".tr),
                            ),
                          ],
                        ),
                        SizedBox(height: spacebetweencomponents ?? 12),
                      ],
                    ),
                  if (islogInPage == false)
                    Column(
                      children: [
                        CustomTextField(
                          hintStyle: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 13.sp,
                                color: ColorPallete.textcolor,
                              ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: SvgPicture.asset(
                              AppImages.lock,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          backgroundColor: ColorPallete.brown,
                          hint: "create_password".tr,
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: ColorPallete.borderyellow,
                            size: 16,
                          ),
                        ),
                        SizedBox(height: spacebetweencomponents ?? 12),
                      ],
                    ),
                  if (islogInPage == false)
                    Column(
                      children: [
                        CustomTextField(
                          hintStyle: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 13.sp,
                                color: ColorPallete.textcolor,
                              ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: SvgPicture.asset(
                              AppImages.lock,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          backgroundColor: ColorPallete.brown,
                          hint: "confirm_password".tr,
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: ColorPallete.borderyellow,
                            size: 16,
                          ),
                        ),
                        SizedBox(height: spacebetweencomponents ?? 12),
                      ],
                    ),
                  if (islogInPage == false)
                    Column(
                      children: [
                        CustomTextField(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: SvgPicture.asset(
                              AppImages.gift,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          backgroundColor: ColorPallete.brown,
                          hint: "enter_referral_code".tr,
                          hintStyle: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 13.sp,
                                color: ColorPallete.textcolor,
                              ),
                          suffixIcon: SizedBox(
                            width: 80,
                            child: Center(
                              child: Text(
                                "optional".tr,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: ColorPallete.textcolor,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: spacebetweencomponents ?? 12),
                      ],
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          borderColor: ColorPallete.borderyellow,
                          backgroundColor: ColorPallete.brown,

                          radius: 12.r,
                          width: 164,
                          height: 36,
                          suffixIcon: SvgPicture.asset(
                            AppImages.google,
                            height: 16,
                            width: 16,
                          ),
                          onPressed: () {},
                          text: "continue_with".tr.toUpperCase(),
                          textStyle: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 13.sp,
                              ),
                        ),
                      ),
                      SizedBox(width: 10.w),
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

                          onPressed: () {
                            Get.offNamed(AppRoutes.home);
                          },
                          text: (islogInPage == true)
                              ? 'login'.tr
                              : "create_account".tr.toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: spacebetweencomponents ?? 12),
                  if (islogInPage == true)
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                borderColor: ColorPallete.borderyellow,
                                backgroundColor: ColorPallete.transparent,

                                radius: 12.r,
                                width: 164,
                                height: 36,

                                onPressed: () {},
                                text: "login_with_otp".tr,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp,
                                      color: ColorPallete.playasguest,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: spacebetweencomponents ?? 12),
                      ],
                    ),

                  RichText(
                    text: TextSpan(
                      text: islogInPage
                          ? 'dont_have_an_account'.tr
                          : '${'already_have_an_account'.tr} ',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(fontSize: 13.sp),
                      children: [
                        TextSpan(
                          text: (islogInPage == true)
                              ? 'sign_up'.tr.capitalize
                              : "login".tr.capitalize,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: ColorPallete.yellow,
                                fontSize: 13.sp,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              if (islogInPage == true) {
                                Get.offNamed(AppRoutes.signup);
                              } else {
                                Get.offNamed(AppRoutes.login);
                              }
                            },
                        ),
                      ],
                    ),
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
