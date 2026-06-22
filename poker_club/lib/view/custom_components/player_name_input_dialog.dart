import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/components/app_button.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/services/api_service.dart';
import 'package:poker_club/services/player_service.dart';
import 'package:poker_club/view/custom_components/custom_snackbar.dart';
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
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;
  var nameError = false;

  Future<void> onSubmit() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() => nameError = true);
      return;
    } else {
      setState(() => nameError = false);
    }
    try {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 500.w),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.only(top: 32.h, left: 24.w),
                        child: SvgPicture.asset(
                          AppImages.namePopupBg,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 7.h,
                      left: 120.w,
                      right: 0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.namePopupTopIconFrame,
                            height: 44.h,
                          ),
                          Positioned(
                            top: 18.h,
                            child: SvgPicture.asset(
                              AppImages.namePopupIcon,
                              height: 16.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Gap(2.h),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 200.w,
                                padding: EdgeInsets.only(bottom: 6.h),
                                child: SvgPicture.asset(
                                  AppImages.mainCharacterPopup,
                                  // fit: BoxFit.fitWidth,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.fromLTRB(
                                    24.w,
                                    24.h,
                                    24.w,
                                    0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        spacing: 4.w,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            AppImages.namePopupArrowDesignIcon,
                                            width: 20.w,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'What\'s Your',
                                                style: GoogleFonts.cinzel(
                                                  color: Colors.yellow.shade700,
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                'Name?',
                                                style: GoogleFonts.cinzel(
                                                  color: Colors.yellow.shade700,
                                                  fontSize: 40.sp,
                                                  fontWeight: FontWeight.bold,
                                                  height: 0.5.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Transform.rotate(
                                            angle: 3.1416, // Rotate 180 degrees
                                            child: SvgPicture.asset(
                                              AppImages
                                                  .namePopupArrowDesignIcon,
                                              width: 20.w,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(6.h),
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.w,
                                          ),
                                          child: SvgPicture.asset(
                                            AppImages.namePopupDivider,
                                            // width: 100.w,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Don\'t worry, you can change this later.',
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 9.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Gap(4.h),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            AppImages.namePopupNameInputFrame,
                                          ),
                                          TextFormField(
                                            controller: _nameController,
                                            textInputAction:
                                                TextInputAction.done,
                                            onChanged: (value) {
                                              if (nameError &&
                                                  value.trim().isNotEmpty) {
                                                setState(
                                                  () => nameError = false,
                                                );
                                              }
                                            },
                                            onFieldSubmitted: (value) =>
                                                onSubmit(),
                                            style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                            ),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                    56.w,
                                                    8.h,
                                                    12.w,
                                                    8.h,
                                                  ),
                                              hintText: 'ENTER YOUR NAME',
                                              hintStyle: GoogleFonts.montserrat(
                                                color: Colors.white.withValues(
                                                  alpha: 0.6,
                                                ),
                                                fontSize: 11.sp,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (nameError)
                                        Text(
                                          nameError
                                              ? 'Name cannot be empty'
                                              : '',
                                          style: GoogleFonts.montserrat(
                                            color: Colors.red,
                                            fontSize: 10.sp,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      Gap(2.h),
                                      AppButton(
                                        onTap: onSubmit,
                                        label: 'CONTINUE',
                                        width: 100,
                                        height: 24,
                                        labelFontSize: 14,
                                        isLoading: _isLoading,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    //   child: Form(
                    //     key: _formKey,
                    //     child: Column(
                    //       mainAxisSize: MainAxisSize.min,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'What\'s your name?',
                    //           style: TextStyle(
                    //             color: Colors.yellow.shade700,
                    //             fontSize: 24.sp,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //         SizedBox(height: 14.h),
                    //         CustomTextField(
                    //           controller: _nameController,
                    //           hintStyle: Theme.of(context).textTheme.bodyMedium
                    //               ?.copyWith(
                    //                 fontSize: 16.sp,
                    //                 color: ColorPallete.textcolor,
                    //               ),
                    //           prefixIcon: Padding(
                    //             padding: EdgeInsets.all(10.w),
                    //             child: AppIcon(AppIcons.person),
                    //           ),
                    //           backgroundColor: ColorPallete.brown,
                    //           hint: "enter_your_name".tr,
                    //           height: 36.h,
                    //           textInputAction: TextInputAction.done,
                    //           validator: (value) {
                    //             if (value == null || value.trim().isEmpty) {
                    //               return 'name_cant_be_empty'.tr;
                    //             }
                    //             return null;
                    //           },
                    //           onFieldSubmitted: (value) => onSubmit(),
                    //         ),
                    //         SizedBox(height: 4.h),
                    //         Text(
                    //           "Don't worry, you can change this later.",
                    //           style: TextStyle(
                    //             fontSize: 13.sp,
                    //             fontWeight: FontWeight.w600,
                    //             color: Colors.white.withValues(alpha: 0.6),
                    //           ),
                    //         ),
                    //         SizedBox(height: 10.h),
                    //         CustomButton(
                    //           onPressed: onSubmit,
                    //           text: "continue".tr.toUpperCase(),
                    //           width: double.infinity,
                    //           height: 26.h,
                    //           backgroundColor: ColorPallete.yellow,
                    //           textStyle: TextStyle(
                    //             color: ColorPallete.darkTransparent,
                    //             fontSize: 13.sp,
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //           radius: 24.r,
                    //           isLoading: _isLoading,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
