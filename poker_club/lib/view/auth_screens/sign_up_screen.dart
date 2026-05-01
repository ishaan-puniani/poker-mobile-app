import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/route_manager.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/view/auth_screens/auth_screen_components/create_account.dart';
import 'package:poker_club/view/auth_screens/auth_screen_components/mobile_pass_refer.dart';
import 'package:poker_club/view/custom_components/custom_back_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: ColorPallete.primarybgcolor,
              image: DecorationImage(
                image: AssetImage(AppImages.splashbackground),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //create account
                      CreateAccount(islogInPage: false),
                      SizedBox(width: 48.w),
                      // login details
                      MobilePassRefer(islogInPage: false),
                    ],
                  ),
                ),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12.5, right: 37.5.w),
                      child: RichText(
                        text: TextSpan(
                          text: "by_creating_an_account".tr,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                          children: [
                            TextSpan(
                              text: "terms_and_condition".tr,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: ColorPallete.yellow,
                                    fontSize: 12.sp,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigate to Terms screen
                                },
                            ),
                            TextSpan(
                              text: "and".tr,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            TextSpan(
                              text: "private_policy".tr,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: ColorPallete.yellow,
                                    fontSize: 12.sp,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigate to Privacy screen
                                },
                            ),
                            TextSpan(text: "."),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: CustomBackButton(
              back: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
