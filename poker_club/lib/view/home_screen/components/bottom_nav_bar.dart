import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';

class NavigationItem {
  final String icon;
  final String label;

  /// Pre-styled footer SVG asset that already includes its own gold frame.
  /// When set, the item renders this asset directly instead of the
  /// circular [icon] container.
  final String? imageAsset;

  /// Whether this item is the raised, enlarged center item (LUCKY SPIN).
  final bool isCenter;

  NavigationItem(
    this.icon,
    this.label, {
    this.imageAsset,
    this.isCenter = false,
  });
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
    return Container(
      padding: EdgeInsets.only(bottom: 8.h),
      // height: 60.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Curved footer back-frame spanning the full width.
          SizedBox(
            height: 36.h,
            child: Transform.scale(
              scale: 1.05,
              child: SvgPicture.asset(
                AppImages.footerBackFrame,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
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
      ),
    );
  }

  Widget _buildNavItem(int index, NavigationItem item) {
    final isSelected = selectedIndex == index;
    final color = ColorPallete.borderyellow;

    Widget iconWidget;
    if (item.imageAsset != null) {
      // Pre-styled asset already carries its gold frame.
      final double iconSize = 60.r;
      iconWidget = SvgPicture.asset(item.imageAsset!, height: iconSize);
    } else {
      // RANKS / MISSION: keep the hand-drawn circular container.
      iconWidget = Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: isSelected ? ColorPallete.darkRed : ColorPallete.richRed,
          shape: BoxShape.circle,
          border: Border.all(color: color, width: isSelected ? 3.w : 1.w),
        ),
        child: AppIcon(
          item.icon,
          color: color,
          size: isSelected ? 40.sp : 28.sp,
        ),
      );
    }

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
              child: iconWidget,
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
        ],
      ),
    );
  }
}
