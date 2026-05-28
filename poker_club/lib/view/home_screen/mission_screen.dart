import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/home_screen/components/home_header.dart';
import 'package:poker_club/viewmodel/home_controller.dart';

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  List<
    (String name, String description, String? endsIn, String price, String icon)
  >
  missions = [
    (
      "Play 3 hands",
      "Participate in 3 poker hands",
      "5h 20m",
      "5K",
      AppImages.casinoCardsCoins,
    ),
    (
      "Go All-In 2 times",
      "Play a game and go All-In",
      "5h 20m",
      "10K",
      AppImages.goldCoins,
    ),
    ("Win 1 game", "Play a game and win", null, "10K", AppImages.crownWinGame),
    (
      "Win 25,000 chips",
      "Play and win 25,000 chips",
      null,
      "20K",
      AppImages.goldCoins,
    ),
  ];

  List<String> weeklyPoints = ["10K", "15K", "20K", "25K", "30K", "50K", "80K"];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            gradient: ColorPallete.primarybgcolor,
            image: DecorationImage(
              image: AssetImage(AppImages.missionbackground),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.5),
                BlendMode.darken,
              ),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: HomeHeader(
                      showProfileInfo: false,
                      showCloseButton: true,
                      showHelpButton: true,
                      title: "MISSIONS",
                      onClose: () => Get.back(),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 130.h,
                        margin: EdgeInsets.only(top: 35.h),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 4.h,
                          ),
                          itemCount: missions.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 32.w),
                          itemBuilder: (context, index) {
                            final (name, description, endsIn, price, icon) =
                                missions[index];
                            return Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  width: 210.w,
                                  margin: EdgeInsets.only(top: 20.h),
                                  decoration: BoxDecoration(
                                    gradient: ColorPallete.redCardGradient,
                                    borderRadius: BorderRadius.circular(16.r),
                                    border: Border.all(
                                      color: ColorPallete.borderyellow
                                          .withValues(alpha: 0.2),
                                      width: 1.w,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: ColorPallete.borderyellow,
                                        blurRadius: 8.r,
                                        offset: Offset.zero,
                                      ),
                                    ],
                                  ),
                                  padding: EdgeInsets.fromLTRB(
                                    18,
                                    40,
                                    18,
                                    18,
                                  ).r,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 1.h),
                                      Text(
                                        description,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 2.h),
                                      Container(
                                        // color: ColorPallete.yellow,
                                        width: 143.w,
                                        height: 1.h,
                                        margin: EdgeInsets.symmetric(
                                          vertical: 4.h,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient:
                                              ColorPallete.dividergradient,
                                        ),
                                      ),
                                      if (endsIn != null)
                                        Text(
                                          "Ends in $endsIn",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      Spacer(),
                                      CustomButton(
                                        onPressed: () {},
                                        text:
                                            '${"get".tr.toUpperCase()} $price',
                                        height: 18.h,
                                        radius: 100.r,
                                        backgroundColor: ColorPallete.yellow,
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    icon,
                                    height: 45.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: ColorPallete.primarybgcolorVertical2,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 24.w,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 1.h,
                              margin: EdgeInsets.symmetric(horizontal: 48.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                gradient: ColorPallete.yellowgradient2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.weeklyCalender,
                                  fit: BoxFit.contain,
                                  height: 40.h,
                                ),
                                ...List.generate(weeklyPoints.length, (index) {
                                  final weekPoint = weeklyPoints[index];
                                  return Column(
                                    spacing: 6.h,
                                    children: [
                                      Text(
                                        "Day ${index + 1}",
                                        style: TextStyle(
                                          color: ColorPallete.yellow,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Material(
                                        color: ColorPallete.richRed,
                                        shape: CircleBorder(
                                          side: BorderSide(
                                            color: ColorPallete.borderyellow,
                                            width: 1.w,
                                          ),
                                        ),
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(18.r),
                                          child: Icon(
                                            Icons.check,
                                            color: ColorPallete.goldLight,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        weekPoint,
                                        style: TextStyle(
                                          color: ColorPallete.yellow,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                                Image.asset(
                                  AppImages.jackpotGalore,
                                  fit: BoxFit.contain,
                                  height: 40.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
