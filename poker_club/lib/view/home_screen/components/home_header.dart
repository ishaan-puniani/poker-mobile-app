import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/services/auth_service.dart';
import 'package:poker_club/utils/custom_functions.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_icon_button.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';
import '../../../model/user_profile.dart';
import '../../custom_components/custom_button.dart';

class HomeHeader extends StatefulWidget {
  final bool showBuyButton;
  final bool showProfileInfo;
  final bool showSettingsButton;
  final bool showCloseButton;
  final bool showHelpButton;
  final void Function()? onClose;
  final String? title;
  const HomeHeader({
    super.key,
    this.showBuyButton = false,
    this.showProfileInfo = true,
    this.showSettingsButton = false,
    this.showCloseButton = false,
    this.showHelpButton = false,
    this.onClose,
    this.title,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  final AuthController authController = Get.find<AuthController>();
  UserProfile? get user => authController.user.value;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(color: Color(0XFF2B0303)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withValues(alpha: 0.8),
                Colors.black.withValues(alpha: 0.2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border(
              bottom: BorderSide(
                color: ColorPallete.borderyellow.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 12.w,
            children: [
              // User Info Section
              if (widget.showProfileInfo) _buildProfileInfoSection(),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Chips Balance
                  _buildChipsBalanceSection(),
                  SizedBox(width: 8.w),
                  // BUY Button
                  if (widget.showBuyButton)
                    CustomButton(
                      onPressed: () {},
                      text: 'BUY',
                      width: 80.w,
                      height: 20.h,
                      radius: 16.r,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                      backgroundGradient: ColorPallete.rightbuttongradient,
                    ),
                ],
              ),

              if (widget.title != null)
                Text(
                  widget.title!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),

              if (widget.showHelpButton ||
                  widget.showSettingsButton ||
                  widget.showCloseButton)
                Row(
                  spacing: 12.w,
                  children: [
                    if (widget.showHelpButton)
                      CustomIconButton(icon: AppIcons.questionCircle),
                    if (widget.showSettingsButton)
                      CustomIconButton(
                        icon: AppIcons.settings,
                        onTap: () {
                          AuthService.signOut();
                        },
                      ),
                    if (widget.showCloseButton)
                      CustomIconButton(
                        icon: AppIcons.close,
                        onTap: widget.onClose,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildChipsBalanceSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorPallete.richRed,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: ColorPallete.borderyellow.withValues(alpha: 0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100.r),
            child: Transform.scale(
              scale: 1.1.r,
              child: AppIcon(AppIcons.gameCoin, size: 16.r),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            user != null ? '\$${formatCoins(user!.coins)}' : '\$0',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildProfileInfoSection() {
    return Container(
      padding: EdgeInsets.only(right: 16.w),
      child: Row(
        children: [
          if (user?.avatar != null)
            Container(
              padding: EdgeInsets.all(2.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: ColorPallete.rightbuttongradient,
              ),
              child: CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(user?.avatar ?? ''),
              ),
            ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user?.username ?? user?.mobile ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (user?.tier != null)
                Text(
                  user?.tier ?? '',
                  style: TextStyle(
                    color: ColorPallete.textcolor,
                    fontSize: 10.sp,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
