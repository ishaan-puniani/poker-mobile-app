import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/resources/strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorPallete.primarybgcolor,
          // image: DecorationImage(image: AssetImage(AppImages.splashbackgroundtwo)) // 👈 your gradient
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) =>
                        ColorPallete.yellowgradient.createShader(bounds),

                    child: Text(
                      textAlign: TextAlign.center,
                      AppStrings.appname.tr,
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(
                              0.8,
                            ), // ✅ 80% shadow
                            blurRadius: 50,
                            offset: Offset(2, 2),
                          ),
                        ],
                        fontSize: 42.sp,
                        color: Colors.white, // required (will be masked)
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  "Loading... 45%",
                  style: TextStyle(color: ColorPallete.yellow),
                ),
                SizedBox(height: 12.h),
                Container(
                  width: 300.w,
                  child: LinearProgressIndicator(
                    value: 0.5, // 50% progress (optional)
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: ColorPallete.primarybgcolor, // 👈 your gradient
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Shufftling the deck...",
                style: TextStyle(color: ColorPallete.lightyellow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
