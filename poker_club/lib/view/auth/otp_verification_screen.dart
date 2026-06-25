import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/route_manager.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/services/auth_service.dart';
import 'package:poker_club/view/auth/components/create_account.dart';
import 'package:poker_club/view/custom_components/custom_back_button.dart';
import 'package:poker_club/view/custom_components/custom_snackbar.dart';
import 'package:poker_club/view/auth/components/verify_with_otp_auth_component.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final String mobile = Get.arguments['mobile'] ?? '';
  final String verifyFor = Get.arguments['verify_for'] ?? 'signin';
  final _otpController = TextEditingController();
  bool _isLoading = false;

  Future<void> onSubmit() async {
    try {
      setState(() {
        _isLoading = true;
      });
      if (verifyFor == 'signup') {
        await AuthService.verifyOtpForSignUp(
          mobile,
          _otpController.text.trim(),
        );
      } else if (verifyFor == 'reset_password') {
        await AuthService.verifyOtpForResetPassword(
          mobile,
          _otpController.text.trim(),
        );
      } else {
        await AuthService.verifyOtpForSignIn(
          mobile,
          _otpController.text.trim(),
        );
      }
      CustomSnackbar.show(
        "OTP verified successfully",
        // ignore: use_build_context_synchronously
        context,
        type: SnackbarType.success,
      );
    } catch (e) {
      // Handle verification error
      final error = e is DioException
          ? e.response?.data ?? e.message
          : e.toString();
      CustomSnackbar.show(
        error.isNotEmpty ? error : "Failed to verify OTP",
        // ignore: use_build_context_synchronously
        context,
        type: SnackbarType.error,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                      title: "verify_with_otp".tr.toUpperCase(),
                      subtitle: "enter_your_one_time_pass".tr,
                      islogInPage: false,
                    ),
                    SizedBox(width: 48.w),

                    // login details
                    VerifyWithOtpAuthComponent(
                      controller: _otpController,
                      spacebetweencomponents: 12,
                      height: 134,
                      width: 380,
                      nextbuttontitle: "verify".tr,
                      isLoading: _isLoading,
                      onTap: onSubmit,
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
