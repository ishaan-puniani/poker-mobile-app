import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/services/api_service.dart';
import 'package:poker_club/services/player_service.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/custom_components/custom_snackbar.dart';
import 'package:poker_club/view/custom_components/custom_textfield.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';

void showInputNameDialog(Function(String? name) onNameSubmitted) {
  Get.dialog(
    Dialog.fullscreen(
      backgroundColor: Colors.transparent,
      child: PlayerNameInputDialog(),
    ),
  );
}

class PlayerNameInputDialog extends StatefulWidget {
  const PlayerNameInputDialog({super.key});

  @override
  State<PlayerNameInputDialog> createState() => _PlayerNameInputDialogState();
}

class _PlayerNameInputDialogState extends State<PlayerNameInputDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;

  Future<void> onSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final name = _nameController.text.trim();
        setState(() => _isLoading = true);
        final msg = await PlayerService.updatePlayerName(name);
        if (msg.isNotEmpty) {
          if (Get.isRegistered<AuthController>()) {
            await Get.find<AuthController>().fetchUserProfile();
          }
          // ignore: use_build_context_synchronously
          CustomSnackbar.show(msg, context, type: SnackbarType.success);
        }
        Get.back(closeOverlays: true);
      } catch (e) {
        final errorMsg = ApiService.getErrorMessage(e);
        CustomSnackbar.show(
          errorMsg ?? 'An error occurred',
          // ignore: use_build_context_synchronously
          context,
          type: SnackbarType.error,
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            right: 26.w,
            bottom: 0,
            child: Image.asset(AppImages.characterCasinoDealer),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 360.w,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              decoration: BoxDecoration(
                gradient: ColorPallete.primarybgcolor,
                border: Border.all(
                  color: Colors.yellow.withValues(alpha: 0.8),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What\'s your name?',
                      style: TextStyle(
                        color: Colors.yellow.shade700,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    CustomTextField(
                      controller: _nameController,
                      hintStyle: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(
                            fontSize: 16.sp,
                            color: ColorPallete.textcolor,
                          ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: AppIcon(AppIcons.person),
                      ),
                      backgroundColor: ColorPallete.brown,
                      hint: "enter_your_name".tr,
                      height: 36.h,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'name_cant_be_empty'.tr;
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) => onSubmit(),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Don't worry, you can change this later.",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomButton(
                      onPressed: onSubmit,
                      text: "continue".tr.toUpperCase(),
                      width: double.infinity,
                      height: 26.h,
                      backgroundColor: ColorPallete.yellow,
                      textStyle: TextStyle(
                        color: ColorPallete.darkTransparent,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      radius: 24.r,
                      isLoading: _isLoading,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
