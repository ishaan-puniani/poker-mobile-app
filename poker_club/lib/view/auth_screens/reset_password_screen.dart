import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/route_manager.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/view/auth_screens/auth_screen_components/create_account.dart';
import 'package:poker_club/view/auth_screens/auth_screen_components/reset_password_component.dart';
import 'package:poker_club/view/custom_components/custom_back_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //create account
                    CreateAccount(
                      title: "change_password".tr.toUpperCase(),
                      subtitle: "create_a_new_password_for_your_account".tr,
                      islogInPage: false,
                    ),
                    SizedBox(width: 48.w),

                    // login details
                    ResetPasswordComponent(
                      spacebetweencomponents: 12,
                      height: 134,
                      width: 380,
                      nextbuttontitle: "save".tr,
                      ontap: () {
                        //reset password
                        Get.offNamed(AppRoutes.home);
                      },
                    ),
                  ],
                ),
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
