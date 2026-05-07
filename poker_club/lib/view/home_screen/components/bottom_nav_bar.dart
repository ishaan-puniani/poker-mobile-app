import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 28.r,
            children: [
              _buildNavItem(0, AppIcons.club, 'RANKS'),
              _buildNavItem(1, AppIcons.calender, 'MISSION'),
              _buildNavItem(2, AppIcons.dices, 'LUCKY SPIN'),
              _buildNavItem(3, AppIcons.giftBox, 'REWARDS'),
              _buildNavItem(4, AppIcons.mail, 'UPDATES'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String label) {
    final isSelected = selectedIndex == index;
    final color = ColorPallete.borderyellow;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: isSelected ? ColorPallete.darkRed : ColorPallete.richRed,
              shape: BoxShape.circle,
              border: Border.all(color: color, width: isSelected ? 3.w : 1.w),
            ),
            child: AppIcon(
              icon,
              color: color,
              size: isSelected ? 48.sp : 28.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
