import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:poker_club/resources/images.dart';

class AppButton extends StatelessWidget {
  final String backgroundAsset;
  final double width;
  final double height;
  final Widget? child;
  final String label;
  final Color? labelColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final VoidCallback? onTap;
  const AppButton({
    super.key,
    this.backgroundAsset = AppImages.mainButtonFrame,
    this.width = 200,
    this.height = 24,
    this.child,
    this.label = 'Button',
    this.onTap,
    this.labelColor = Colors.black,
    this.labelFontSize = 10,
    this.labelFontWeight = FontWeight.w800,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width.w,
        height: height.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(backgroundAsset, fit: BoxFit.fill),
            if (child != null)
              Positioned.fill(child: child!)
            else
              Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: labelColor,
                    fontSize: labelFontSize?.sp,
                    fontWeight: labelFontWeight,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
