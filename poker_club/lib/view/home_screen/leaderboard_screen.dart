import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/home_screen/components/home_header.dart';
import 'package:poker_club/viewmodel/home_controller.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final List<(String name, String points)> leaderboardData = [
    ('ANDREWSACRES', '2,210,000,000'),
    ('BOXCARBOK', '705,600,002'),
    ('GHOSTEZ', '480,000,001'),
    ('A.CHAN', '480,000,001'),
    ('POOFYCOMBS', '403,200,001'),
    ('ANDREWSACRES', '396,000,001'),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            gradient: ColorPallete.primarybgcolor,
            image: DecorationImage(
              image: AssetImage(AppImages.homebackground),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.8),
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
                      onClose: () => Get.back(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36.h, left: 40.w, right: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 5, child: _buildLeaderboardSection()),
                        SizedBox(width: 36.w),
                        Expanded(flex: 4, child: _buildChampionsSection()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildChampionsSection() {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 12.r),
      children: [
        Text(
          'tournament_champions'.tr.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        Divider(
          color: ColorPallete.borderyellow.withValues(alpha: 0.5),
          thickness: 1,
        ),
        SizedBox(height: 2.h),
        Container(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10).r,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: ColorPallete.borderyellow.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "high_roller_showdown".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorPallete.yellow,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AppIcon(AppIcons.chevronDown),
            ],
          ),
        ),
        SizedBox(height: 12.r),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 20.r),
          decoration: BoxDecoration(
            gradient: ColorPallete.redCardGradient,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: ColorPallete.borderyellow, width: 1.5),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 32.r,
                backgroundColor: ColorPallete.yellow,
                child: Padding(
                  padding: EdgeInsets.all(1).r,
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage(
                      AppImages.characterCasinoDealer,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ultra_high_winner".tr.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPallete.yellow,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "ANDREWSACRES".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPallete.yellow,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text.rich(
                    TextSpan(
                      text: "${"amount_won".tr.toUpperCase()}: ",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 6.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "\$2,210,000,000",
                          style: TextStyle(
                            color: ColorPallete.yellow,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.r),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 20.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: ColorPallete.borderyellow.withValues(alpha: 0.3),
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22.5.r,
                backgroundColor: ColorPallete.yellow,
                child: Padding(
                  padding: EdgeInsets.all(1).r,
                  child: CircleAvatar(
                    radius: 20.5.r,
                    backgroundImage: AssetImage(
                      AppImages.characterCasinoDealer,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ultra_high_winner".tr.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPallete.red,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "BOXCARBOK".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorPallete.yellow,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text.rich(
                    TextSpan(
                      text: "${"amount_won".tr.toUpperCase()}: ",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 6.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: "\$2,210,000,000",
                          style: TextStyle(
                            color: ColorPallete.yellow,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardSection() {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 12.r),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'leaderboard'.tr.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'points'.tr.toUpperCase(),
              style: TextStyle(
                color: ColorPallete.yellow,
                fontSize: 8.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Divider(
          color: ColorPallete.borderyellow.withValues(alpha: 0.5),
          thickness: 1,
        ),
        SizedBox(height: 2.h),
        ...List.generate(leaderboardData.length, (index) {
          final player = leaderboardData[index];
          return Container(
            margin: EdgeInsets.only(bottom: 6.h),
            decoration: BoxDecoration(
              color: ColorPallete.redsnackbar,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: ColorPallete.borderyellow.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                Container(
                  width: 38.r,
                  height: 36.r,
                  decoration: BoxDecoration(
                    gradient: ColorPallete.yellowgradient2,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    (index + 1).toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                CircleAvatar(
                  radius: 14.r,
                  backgroundColor: ColorPallete.yellow,
                  child: CircleAvatar(
                    radius: 12.5.r,
                    backgroundImage: AssetImage(
                      AppImages.characterCasinoDealer,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  player.$1.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Text(
                  '\$${player.$2}',
                  style: TextStyle(
                    color: ColorPallete.yellow,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 12.w),
              ],
            ),
          );
        }),
      ],
    );
  }
}
