import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';

class VerifyWithOtpAuthComponent extends StatelessWidget {
  final int? height;
  final int? width;
  final double? spacebetweencomponents;
  final String? nextbuttontitle;
  final VoidCallback ontap;
  const VerifyWithOtpAuthComponent({
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
                  Pinput(
                    length: 6,
                    hapticFeedbackType: HapticFeedbackType.lightImpact,

                    defaultPinTheme: PinTheme(
                      height: 53,

                      width: 53,
                      decoration: BoxDecoration(
                        color: ColorPallete.brown,
                        border: Border.all(
                          color: ColorPallete.borderyellow,
                          width: 1,
                        ),
                        // shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12.5),
                        child: RichText(
                          text: TextSpan(
                            text: "didnt_receive_otp".tr,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                            children: [
                              TextSpan(
                                text: "resend".tr,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: ColorPallete.yellow,
                                      fontSize: 12.sp,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("Terms clicked");
                                    // Navigate to Terms screen
                                  },
                              ),
                            ],
                          ),
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
