import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final double? size;
  final Color? color;
  const AppIcon(
    this.assetPath, {
    super.key,
    this.size = 24,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: width?.r ?? size?.r,
      height: height?.r ?? size?.r,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
