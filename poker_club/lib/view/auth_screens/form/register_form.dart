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
import 'package:poker_club/view/auth_screens/auth_screen_components/form_buttons_section.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_passwordfield.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _referredByController = TextEditingController();
  bool _isLoading = false;
  String errorMessage = '';

  Future<void> onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
        errorMessage = '';
      });
      try {
        await AuthService.signUp(
          _mobileController.text.trim(),
          _createPasswordController.text.trim(),
          referredBy: _referredByController.text.trim(),
        );
      } catch (e) {
        final msg = ApiService.getErrorMessage(e);
        setState(() {
          errorMessage = msg ?? 'Sign Up Failed';
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
            textInputAction: TextInputAction.next,
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
          ),
          Gap(8.h),
          CustomPasswordField(
            controller: _createPasswordController,
            textInputAction: TextInputAction.next,
            prefixIcon: Padding(
              padding: EdgeInsets.all(8.w),
              child: AppIcon(AppIcons.lock, size: 20),
            ),
            backgroundColor: ColorPallete.brown,
            hint: "create_password".tr,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
              color: ColorPallete.textcolor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'create_password_required'.tr;
              }
              if (value.length < 6) {
                return 'password_too_short'.tr;
              }
              return null;
            },
          ),
          Gap(8.h),
          CustomPasswordField(
            controller: _confirmPasswordController,
            textInputAction: TextInputAction.next,
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'confirm_password_required'.tr;
              }
              if (value != _createPasswordController.text) {
                return 'passwords_do_not_match'.tr;
              }
              return null;
            },
          ),
          Gap(8.h),
          CustomTextField(
            controller: _referredByController,
            textInputAction: TextInputAction.done,
            prefixIcon: Padding(
              padding: EdgeInsets.all(8.w),
              child: AppIcon(AppIcons.giftBox, size: 20),
            ),
            suffixIcon: SizedBox(
              width: 80,
              child: Center(
                child: Text(
                  "optional".tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: ColorPallete.textcolor,
                  ),
                ),
              ),
            ),
            backgroundColor: ColorPallete.brown,
            hint: "enter_referral_code".tr,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
              color: ColorPallete.textcolor,
            ),
            onFieldSubmitted: (_) => onSubmit(),
          ),
          Gap(8.h),
          FormButtonsSection(
            submitButtonText: 'create_account'.tr,
            submitLoading: _isLoading,
            onSubmit: onSubmit,
            isGoogleLogin: true,
            onGoogleLogin: () {
              // Handle Google login
            },
          ),
          Gap(8.h),
          RichText(
            text: TextSpan(
              text: '${'already_have_an_account'.tr} ',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 13.sp),
              children: [
                TextSpan(
                  text: 'login'.tr.capitalize,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorPallete.yellow,
                    fontSize: 13.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.offNamed(AppRoutes.login);
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
