import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/resources/images.dart';

class AppButton extends StatelessWidget {
  final String backgroundAsset;
  final double? width;
  final double height;
  final Widget? child;
  final String label;
  final Color? labelColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final VoidCallback? onTap;
  final bool isLoading;
  const AppButton({
    super.key,
    this.backgroundAsset = AppImages.mainButtonFrame,
    this.width,
    this.height = 20,
    this.child,
    this.label = 'Button',
    this.onTap,
    this.labelColor = Colors.black,
    this.labelFontSize = 10,
    this.labelFontWeight = FontWeight.w900,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: SizedBox(
        width: width?.w,
        height: height.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(backgroundAsset, fit: BoxFit.fill),
            if (child != null)
              Positioned.fill(child: child!)
            else
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6.w,
                children: [
                  if (isLoading)
                    SizedBox(
                      width: 12.r,
                      height: 12.r,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        valueColor: AlwaysStoppedAnimation<Color>(labelColor!),
                      ),
                    ),
                  Text(
                    label,
                    style: GoogleFonts.cinzel(
                      color: labelColor,
                      fontSize: labelFontSize?.sp,
                      fontWeight: labelFontWeight,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
