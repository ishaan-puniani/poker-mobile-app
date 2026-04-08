import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
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
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //create account
                    CreateAccount(),
                    SizedBox(width: 48.w),
                    // login details
                    MobilePassRefer(),
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
