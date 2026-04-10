import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/route_manager.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/view/auth_screens/auth_screen_components/create_account.dart';
import 'package:poker_club/view/custom_components/custom_back_button.dart';
import 'package:poker_club/view/custom_components/custom_options.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //create account
                        CreateAccount(
                          title: "reset_password".tr.toUpperCase(),
                          subtitle: "no_worries_we_will_get_you_back".tr,
                          islogInPage: false,
                        ),
                        SizedBox(width: 48.w),

                        // login details
                        CustomOptions(
                          height: 134,
                          width: 380,
                          ontap: () {
                            Get.toNamed(AppRoutes.otpVerificationScreen);
                          },

                          nextbuttontitle: "get_otp".tr,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
