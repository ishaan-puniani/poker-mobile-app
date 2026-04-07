import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final String text;
  final TextStyle? textStyle;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final Color? backgroundColor;
  final Color? borderColor;

  final Gradient? textGradient; // 👈 NEW

  final double radius;
  final double borderWidth;

  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.borderColor,
    this.textGradient, // 👈 NEW
    this.radius = 12,
    this.borderWidth = 1,
    this.padding,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,

          backgroundColor: backgroundColor ?? ColorPallete.darkRed,
          padding:
              padding ?? EdgeInsets.symmetric(vertical: 0.h, horizontal: 2.w),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: borderWidth.w,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[prefixIcon!, SizedBox(width: 8.w)],

            /// 🔥 Gradient / Normal Text
            Flexible(
              child: textGradient != null
                  ? ShaderMask(
                      shaderCallback: (bounds) =>
                          textGradient!.createShader(bounds),
                      child: Text(
                        text.tr,
                        overflow: TextOverflow.ellipsis,
                        style:
                            textStyle ??
                            TextStyle(
                              color: Colors.white, // ⚠️ important
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    )
                  : Text(
                      text.tr,
                      overflow: TextOverflow.ellipsis,
                      style:
                          textStyle ??
                          TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
            ),

            if (suffixIcon != null) ...[SizedBox(width: 8.w), suffixIcon!],
          ],
        ),
      ),
    );
  }
}
