import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';

class FormButtonsSection extends StatelessWidget {
  final String submitButtonText;
  final bool submitLoading;
  final void Function() onSubmit;
  final bool? isGoogleLogin;
  final void Function()? onGoogleLogin;
  const FormButtonsSection({
    super.key,
    this.isGoogleLogin = false,
    required this.submitButtonText,
    required this.onSubmit,
    this.submitLoading = false,
    this.onGoogleLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Expanded(
          child: CustomButton(
            borderColor: ColorPallete.borderyellow,
            backgroundColor: ColorPallete.brown,
            radius: 12.r,
            width: 164,
            height: 36,
            suffixIcon: AppIcon(AppIcons.google, size: 16),
            onPressed: onGoogleLogin,
            text: "continue_with".tr.toUpperCase(),
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            backgroundGradient: ColorPallete.rightbuttongradient,
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ColorPallete.brown,
              fontWeight: FontWeight.w700,
              fontSize: 13.sp,
            ),
            radius: 12.r,
            width: 164,
            height: 36,

            onPressed: onSubmit,
            text: submitButtonText,
            isLoading: submitLoading,
          ),
        ),
      ],
    );
  }
}
