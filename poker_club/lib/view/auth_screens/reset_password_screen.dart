import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/route_manager.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/services/api_service.dart';
import 'package:poker_club/services/auth_service.dart';
import 'package:poker_club/view/auth_screens/auth_screen_components/create_account.dart';
import 'package:poker_club/view/auth_screens/auth_screen_components/form_buttons_section.dart';
import 'package:poker_club/view/auth_screens/auth_screen_components/form_container.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_back_button.dart';
import 'package:poker_club/view/custom_components/custom_passwordfield.dart';
import 'package:poker_club/view/custom_components/custom_snackbar.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final String token = Get.arguments['token'] ?? '';
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  Future<void> onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        setState(() {
          _isLoading = true;
        });
        await AuthService.resetPassword(token, _passwordController.text.trim());
      } catch (e) {
        final errorMsg = ApiService.getErrorMessage(e);
        CustomSnackbar.show(
          errorMsg ?? "Failed to reset password",
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
                      title: "change_password".tr.toUpperCase(),
                      subtitle: "create_a_new_password_for_your_account".tr,
                      islogInPage: false,
                    ),
                    SizedBox(width: 48.w),

                    FormContainer(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomPasswordField(
                              controller: _passwordController,
                              textInputAction: TextInputAction.next,
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: AppIcon(AppIcons.lock),
                              ),
                              backgroundColor: ColorPallete.brown,
                              hint: "enter_the_password".tr,
                              hintStyle: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
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
                            ),
                            Gap(8.h),
                            CustomPasswordField(
                              controller: _confirmPasswordController,
                              textInputAction: TextInputAction.next,
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: AppIcon(AppIcons.lock),
                              ),
                              backgroundColor: ColorPallete.brown,
                              hint: "confirm_password".tr,
                              hintStyle: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13.sp,
                                    color: ColorPallete.textcolor,
                                  ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'confirm_password_required'.tr;
                                }
                                if (value != _passwordController.text) {
                                  return 'passwords_do_not_match'.tr;
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                onSubmit();
                              },
                            ),
                            Gap(8.h),
                            FormButtonsSection(
                              submitButtonText: 'save'.tr,
                              submitLoading: _isLoading,
                              isGoogleLogin: false,
                              onSubmit: onSubmit,
                            ),
                          ],
                        ),
                      ),
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
