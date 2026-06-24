import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
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
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 80.w,
          right: 80.w,
          bottom: 14.h,
          top: 0,
          child: SvgPicture.asset(AppImages.footerBackFrame),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 52.w,
            children: List.generate(navigationItems.length, (index) {
              return _buildNavItem(index, navigationItems[index]);
            }),
          ),
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
            style: GoogleFonts.cinzel(
              color: color,
              fontSize: isSelected ? 14.sp : 12.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          Gap(4.h),
        ],
      ),
    );
  }
}
