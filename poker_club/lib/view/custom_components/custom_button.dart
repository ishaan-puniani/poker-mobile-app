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
  final Gradient? backgroundGradient;

  final Color? borderColor;
  final Gradient? textGradient;

  final double radius;
  final double borderWidth;

  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;

  final List<BoxShadow>? boxShadow;

  final bool isLoading;

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
    this.radius = 48,
    this.borderWidth = 1,
    this.padding,
    this.height,
    this.width,
    this.boxShadow,
    this.isLoading = false,
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
            boxShadow: boxShadow,
          ),
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            borderRadius: borderRadius,
            child: Container(
              alignment: Alignment.center,
              padding: padding ?? EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null && !isLoading) ...[
                    prefixIcon!,
                    SizedBox(width: 8.w),
                  ],

                  if (isLoading) ...[
                    SizedBox(
                      width: 11.w,
                      height: 11.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.w,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          textStyle?.color ?? Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                  ],

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
