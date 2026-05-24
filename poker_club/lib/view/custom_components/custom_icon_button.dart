import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  final void Function()? onTap;
  final double? size;
  final double? iconSize;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.borderColor,
    this.iconColor,
  });

  const CustomIconButton.netral({
    super.key,
    required this.icon,
    this.onTap,
    this.size,
    this.iconSize,
    this.backgroundColor = Colors.black54,
    this.borderColor = Colors.white24,
    this.iconColor = Colors.white,
  });

  static Widget themed({
    required String icon,
    required Color themeColor,
    Color? iconColor = Colors.white,
    void Function()? onTap,
    double? size,
    double? iconSize,
  }) {
    return CustomIconButton(
      icon: icon,
      onTap: onTap,
      size: size,
      iconSize: iconSize,
      backgroundColor: themeColor.withValues(alpha: 0.8),
      borderColor: themeColor,
      iconColor: iconColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size ?? 36.r,
        height: size ?? 36.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? ColorPallete.richRed,
          border: Border.all(
            color: borderColor ?? ColorPallete.borderyellow,
            width: 1.5,
          ),
        ),
        child: Center(
          child: AppIcon(
            icon,
            color: iconColor ?? ColorPallete.borderyellow,
            size: iconSize ?? 18.sp,
          ),
        ),
      ),
    );
  }
}
