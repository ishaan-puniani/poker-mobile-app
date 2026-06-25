import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/services/api_service.dart';
import 'package:poker_club/services/auth_service.dart';
import 'package:poker_club/view/auth/components/form_buttons_section.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/custom_components/custom_passwordfield.dart';
import 'package:poker_club/view/custom_components/custom_snackbar.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';

class LoginForm extends StatefulWidget {
  final bool isOtpLogin;
  const LoginForm({super.key, required this.isOtpLogin});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String errorMessage = '';

  Future<void> onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
        errorMessage = '';
      });
      try {
        if (widget.isOtpLogin) {
          final msg = await AuthService.signInWithOtp(
            _mobileController.text.trim(),
          );
          // ignore: use_build_context_synchronously
          CustomSnackbar.show(msg, context, type: SnackbarType.success);
          Get.toNamed(
            AppRoutes.otpVerificationScreen,
            arguments: {'mobile': _mobileController.text.trim()},
          );
        } else {
          await AuthService.signInWithPassword(
            _mobileController.text.trim(),
            _passwordController.text.trim(),
          );
        }
      } catch (e) {
        final msg = ApiService.getErrorMessage(e);
        setState(() {
          errorMessage = msg ?? 'Login Failed';
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteractionIfError,
      child: Column(
        children: [
          if (errorMessage.isNotEmpty) ...[
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red, fontSize: 12.sp),
            ),
            Gap(8.h),
          ],
          CustomTextField(
            controller: _mobileController,
            textInputAction: widget.isOtpLogin
                ? TextInputAction.done
                : TextInputAction.next,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
              color: ColorPallete.textcolor,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.all(10.w),
              child: AppIcon(AppIcons.mobile),
            ),
            backgroundColor: ColorPallete.brown,
            hint: "enter_mobile_number".tr,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'mobile_number_required'.tr;
              }
              if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                return 'enter_valid_mobile_number'.tr;
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            onFieldSubmitted: (value) {
              if (widget.isOtpLogin) {
                onSubmit();
              }
            },
          ),
          if (!widget.isOtpLogin) ...[
            Gap(8.h),
            CustomPasswordField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.w),
                child: AppIcon(AppIcons.lock),
              ),
              backgroundColor: ColorPallete.brown,
              hint: "enter_the_password".tr,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
                color: ColorPallete.textcolor,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'password_required'.tr;
                }
                if (value.length < 6) {
                  return 'password_too_short'.tr;
                }
                return null;
              },
              onFieldSubmitted: (value) {
                onSubmit();
              },
            ),
            Gap(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.forgotpassword,
                      arguments: {'mobile': _mobileController.text.trim()},
                    );
                  },
                  child: Text("forgot_password".tr),
                ),
              ],
            ),
          ],
          Gap(8.h),
          FormButtonsSection(
            submitButtonText: widget.isOtpLogin ? 'get_otp'.tr : 'login'.tr,
            submitLoading: _isLoading,
            onSubmit: onSubmit,
            isGoogleLogin: true,
            onGoogleLogin: () {
              // Handle Google login
            },
          ),
          Gap(8.h),
          CustomButton(
            borderColor: ColorPallete.borderyellow,
            backgroundColor: ColorPallete.transparent,
            radius: 12.r,
            height: 36,
            onPressed: () {
              if (widget.isOtpLogin) {
                Get.offNamed(AppRoutes.login);
              } else {
                Get.offNamed(AppRoutes.loginOtp);
              }
            },
            text: widget.isOtpLogin
                ? "login_with_password".tr
                : "login_with_otp".tr,
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
              color: ColorPallete.playasguest,
            ),
          ),
          Gap(8.h),
          RichText(
            text: TextSpan(
              text: 'dont_have_an_account'.tr,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 13.sp),
              children: [
                TextSpan(
                  text: 'sign_up'.tr.capitalize,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorPallete.yellow,
                    fontSize: 13.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.offNamed(AppRoutes.signup);
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
