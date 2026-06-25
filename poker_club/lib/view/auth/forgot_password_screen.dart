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
import 'package:poker_club/view/auth/components/create_account.dart';
import 'package:poker_club/view/auth/components/form_buttons_section.dart';
import 'package:poker_club/view/auth/components/form_container.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_back_button.dart';
import 'package:poker_club/view/custom_components/custom_snackbar.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileController = TextEditingController();
  bool _isLoading = false;

  @override
  initState() {
    super.initState();
    // Check if mobile number is passed as an argument
    final args = Get.arguments;
    if (args != null && args['mobile'] != null) {
      _mobileController.text = args['mobile'];
    }
  }

  Future<void> onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        setState(() {
          _isLoading = true;
        });
        await AuthService.forgotPassword(_mobileController.text.trim());
      } catch (e) {
        final errorMsg = ApiService.getErrorMessage(e);
        CustomSnackbar.show(
          errorMsg ?? "Failed to send OTP",
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
                      title: "reset_password".tr.toUpperCase(),
                      subtitle: "no_worries_we_will_get_you_back".tr,
                      islogInPage: false,
                    ),
                    Gap(48.w),
                    FormContainer(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: _mobileController,
                              textInputAction: TextInputAction.done,
                              hintStyle: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
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
                                onSubmit();
                              },
                            ),
                            Gap(8.h),
                            FormButtonsSection(
                              submitButtonText: 'get_otp'.tr,
                              isGoogleLogin: false,
                              submitLoading: _isLoading,
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
