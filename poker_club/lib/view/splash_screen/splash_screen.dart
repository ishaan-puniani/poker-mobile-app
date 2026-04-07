import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/state_manager.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/resources/strings.dart';
import 'package:poker_club/view/splash_screen/splashscreen_widgets/auth_options.dart';
import 'package:poker_club/viewmodel/splashController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (splashController) {
        return Scaffold(
          // extendBody: true,
          body: Container(
            decoration: BoxDecoration(
              gradient: ColorPallete.primarybgcolor,
              image: DecorationImage(
                image: AssetImage(AppImages.splashbackground),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                blurRadius: 50.r,
                                offset: Offset(2, 2),
                              ),
                            ],
                            fontSize: 42.sp,
                            color: Colors.white, // required (will be masked)
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),

                    //authentication buttons will load when new user enters the app
                    splashController.showAuthoptionals == true
                        ? AuthOptions()
                        : Column(
                            children: [
                              SizedBox(height: 32.h),
                              Text(
                                "${AppStrings.loading.tr} ${splashController.progress}%",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: ColorPallete.yellow,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              SizedBox(height: 12.h),
                              Container(
                                width: 300.w,
                                child: LinearProgressIndicator(
                                  value:
                                      splashController.progress /
                                      100, // 50% progress (optional)
                                  backgroundColor: Colors.grey.shade300,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.amber,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 3.w,
                                    ),
                                    child: Text(
                                      AppStrings.shufftlingthedeck.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: ColorPallete.lightyellow,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.sp,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
          // bottomNavigationBar: Container(
          //   color: Colors.transparent,
          //   child: SafeArea(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           AppStrings.shufftlingthedeck.tr,
          //           style: TextStyle(color: ColorPallete.lightyellow),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}
