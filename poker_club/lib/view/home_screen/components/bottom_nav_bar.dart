import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';

class NavigationItem {
  final String icon;
  final String label;
  NavigationItem(this.icon, this.label);
}

class BottomNavBar extends StatelessWidget {
  final List<NavigationItem> navigationItems;
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavBar({
    super.key,
    required this.navigationItems,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // Curved footer back-frame spanning the full width.
        Positioned(
          left: 12.w,
          right: 12.w,
          bottom: 0,
          child: SvgPicture.asset(AppImages.footerBackFrame),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 48.w,
          children: List.generate(navigationItems.length, (index) {
            return _buildNavItem(index, navigationItems[index]);
          }),
        ),
      ],
    );
  }

  Widget _buildNavItem(int index, NavigationItem item) {
    final isSelected = selectedIndex == index;
    final color = ColorPallete.borderyellow;

    return GestureDetector(
      onTap: () => onItemSelected(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
            offset: Offset(0, isSelected ? -8.h : 0),
            child: Transform.scale(
              scale: isSelected ? 1.5 : 1.0,
              child: SvgPicture.asset(item.icon, height: 60.r),
            ),
          ),
          Text(
            item.label,
            style: TextStyle(
              color: color,
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Gap(4.h),
        ],
      ),
    );
  }
}
