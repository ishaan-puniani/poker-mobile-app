import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import '../../../model/user_profile.dart';
import '../../custom_components/custom_button.dart';

class HomeHeader extends StatelessWidget {
  final UserProfile user;
  const HomeHeader({super.key, required this.user});

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
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorPallete.borderyellow.withValues(alpha: 0.5),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // User Info Section
          Container(
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
          ),

          Spacer(),

          // Chips Balance
          Container(
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
                AppIcon(AppIcons.gameCoin, size: 16.sp),
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
          ),

          SizedBox(width: 16.w),

          // BUY Button
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

          Spacer(),

          // Action Icons (Help & Settings)
          _buildActionIcon(AppIcons.questionCircle),
          SizedBox(width: 12.w),
          _buildActionIcon(AppIcons.settings),
        ],
      ),
    );
  }

  Widget _buildActionIcon(String icon) {
    return Container(
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
    );
  }
}
