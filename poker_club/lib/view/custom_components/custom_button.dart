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
  final Gradient? backgroundGradient; // ✅ NEW

  final Color? borderColor;
  final Gradient? textGradient;

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
    this.backgroundGradient,
    this.borderColor,
    this.textGradient,
    this.radius = 12,
    this.borderWidth = 1,
    this.padding,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(radius.r);

    return SizedBox(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: backgroundGradient == null
                ? (backgroundColor ?? ColorPallete.darkRed)
                : null,
            gradient: backgroundGradient,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth.w,
            ),
          ),
          child: InkWell(
            onTap: onPressed,
            borderRadius: borderRadius,
            child: Container(
              alignment: Alignment.center,
              padding: padding ?? EdgeInsets.all(0),
              // padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    SizedBox(width: 8.w),
                  ],

                  /// 🔥 TEXT (Gradient / Normal)
                  Flexible(
                    child: textGradient != null
                        ? ShaderMask(
                            shaderCallback: (bounds) =>
                                textGradient!.createShader(bounds),
                            blendMode: BlendMode.srcIn,
                            child: Text(
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

                  if (suffixIcon != null) ...[
                    SizedBox(width: 8.w),
                    suffixIcon!,
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
