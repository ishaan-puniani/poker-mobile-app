import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import '../../../model/user_profile.dart';
import '../../custom_components/custom_button.dart';

class HomeHeader extends StatelessWidget {
  final UserProfile user;
  final bool showBuyButton;
  final bool showProfileInfo;
  final bool showSettingsButton;
  final bool showCloseButton;
  final bool showHelpButton;
  final void Function()? onClose;
  final String? title;
  const HomeHeader({
    super.key,
    required this.user,
    this.showBuyButton = false,
    this.showProfileInfo = true,
    this.showSettingsButton = false,
    this.showCloseButton = false,
    this.showHelpButton = false,
    this.onClose,
    this.title,
  });

  String formatCoins(double coins) {
    return coins
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: ColorPallete.darkTransparent.withValues(alpha: 0.4),
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
          if (showProfileInfo) _buildProfileInfoSection(),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Chips Balance
              _buildChipsBalanceSection(),
              SizedBox(width: 8.w),
              // BUY Button
              if (showBuyButton)
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

          if (title != null)
            Text(
              title!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

          if (showHelpButton || showSettingsButton || showCloseButton)
            Row(
              spacing: 12.w,
              children: [
                if (showHelpButton) _buildActionIcon(AppIcons.questionCircle),
                if (showSettingsButton) _buildActionIcon(AppIcons.settings),
                if (showCloseButton)
                  _buildActionIcon(AppIcons.close, onTap: onClose),
              ],
            ),
        ],
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
            '\$${formatCoins(user.coins)}',
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
          Container(
            padding: EdgeInsets.all(2.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: ColorPallete.rightbuttongradient,
            ),
            child: CircleAvatar(
              radius: 20.r,
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user.username,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.tier,
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

  Widget _buildActionIcon(String icon, {void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36.r,
        height: 36.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorPallete.richRed,
          border: Border.all(
            color: ColorPallete.borderyellow.withValues(alpha: 0.8),
            width: 1.5,
          ),
        ),
        child: Center(
          child: AppIcon(icon, color: ColorPallete.borderyellow, size: 18.sp),
        ),
      ),
    );
  }
}
