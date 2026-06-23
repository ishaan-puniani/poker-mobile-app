import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/utils/custom_extensions.dart' show StringExtension;
import 'package:poker_club/utils/custom_functions.dart';
import 'package:poker_club/view/home_screen/main_menu_dialog/main_menu_dialog.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';
import 'package:poker_club/viewmodel/wallet_controller.dart';
import '../../../model/user_profile.dart';

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
  final WalletController walletController = Get.find<WalletController>();
  UserProfile? get user => authController.user.value;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        alignment: Alignment.center,
        children: [
          // Ornate golden header frame background
          Positioned.fill(
            left: 12.w,
            right: 12.w,
            top: -5.h,
            child: SvgPicture.asset(AppImages.headerFrame, fit: BoxFit.fill),
          ),
          // Foreground content
          Padding(
            padding: EdgeInsets.fromLTRB(48.w, 2.h, 48.w, 6.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left: profile info
                if (widget.showProfileInfo) _buildProfileInfoSection(),
                // Center: chips balance + BUY
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildChipsBalanceSection(),
                    if (widget.showBuyButton) ...[
                      SizedBox(width: 10.w),
                      _buildBuyButton(),
                    ],
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

                // Right: help / settings / close
                _buildActionsSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionsSection() {
    final children = <Widget>[];
    if (widget.showHelpButton) {
      children.add(
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(AppImages.headerInfoIcon, height: 36.r),
        ),
      );
    }
    if (widget.showSettingsButton) {
      children.add(
        GestureDetector(
          onTap: () => authController.logout(),
          child: SvgPicture.asset(AppImages.headerSettingIcon, height: 36.r),
        ),
      );
    }
    if (widget.showCloseButton) {
      children.add(
        GestureDetector(
          onTap: widget.onClose,
          child: SvgPicture.asset(AppImages.blackCrossIcon, height: 34.r),
        ),
      );
    }
    if (children.isEmpty) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 10.w,
      children: children,
    );
  }

  Widget _buildBuyButton() {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(AppImages.buyButton, height: 22.h),
    );
  }

  Widget _buildChipsBalanceSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppImages.scoreButton,
          fit: BoxFit.fitHeight,
          height: 20.h,
        ),
        Positioned(
          left: 40.w,
          child: Padding(
            padding: EdgeInsets.only(bottom: 1.5.h),
            child: Text(
              walletController.isLoading.value
                  ? 'Loading...'
                  : '${user?.currencySymbol}${formatCoins(walletController.balance.value)}',
              style: GoogleFonts.montserrat(
                color: ColorPallete.lightyellow,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileInfoSection() {
    return GestureDetector(
      onTap: () => showMainMenuDialog(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Ornate avatar frame with user avatar inside
          SizedBox(
            width: 46.r,
            height: 46.r,
            child: Stack(
              alignment: Alignment.center,
              // fit: StackFit.expand,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 2.0, top: 2),
                  child: ClipOval(
                    child: SvgPicture.asset(
                      UserProfile.getAvatarAsset(user?.avatar),
                      width: 38.r,
                      height: 38.r,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  AppImages.profileFrame,
                  width: 46.r,
                  height: 46.r,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user?.fullName.toTitleCase() ?? user?.mobile ?? '',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                spacing: 4.w,
                children: [
                  SvgPicture.asset(AppImages.proLeagueButton, height: 10.h),
                  Text(
                    'Pro League',
                    style: GoogleFonts.montserrat(
                      color: ColorPallete.lightyellow,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
