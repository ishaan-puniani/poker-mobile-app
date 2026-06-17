import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/view/auth_screens/auth_screen_components/form_buttons_section.dart';
import 'package:poker_club/view/auth_screens/auth_screen_components/form_container.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';

class ProfileSectionView extends StatelessWidget {
  const ProfileSectionView({
    super.key,
    required this.formKey,
    required this.mobileController,
    required this.usernameController,
    required this.isLoading,
    required this.onSubmit,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController mobileController;
  final TextEditingController usernameController;
  final bool isLoading;
  final Future<void> Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(12).r,
          child: FormContainer(
            child: Form(
              key: formKey,
              child: Column(
                spacing: 12.h,
                children: [
                  CustomTextField(
                    controller: mobileController,
                    label: 'mobile_number'.tr,
                    readOnly: true,
                    textInputAction: TextInputAction.next,
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                      color: ColorPallete.textcolor,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ).r,
                    backgroundColor: Colors.black.withValues(alpha: 0.5),
                    hint: 'enter_mobile_number'.tr,
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
                  CustomTextField(
                    controller: usernameController,
                    label: 'username'.tr,
                    textInputAction: TextInputAction.next,
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 13.sp,
                      color: ColorPallete.textcolor,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ).r,
                    backgroundColor: Colors.black.withValues(alpha: 0.5),
                    hint: 'enter_username'.tr,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'username_required'.tr;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: const AppIcon(AppIcons.editUnderline, size: 18),
                    ),
                    onFieldSubmitted: (_) => onSubmit(),
                  ),
                  FormButtonsSection(
                    submitButtonText: 'update'.tr.toUpperCase(),
                    onSubmit: onSubmit,
                    submitLoading: isLoading,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
