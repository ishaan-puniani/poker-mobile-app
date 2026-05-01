import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import '../../viewmodel/home_controller.dart';
import 'components/home_header.dart';
import 'components/game_carousel.dart';
import 'components/bottom_nav_bar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

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
                    child: Obx(
                      () => HomeHeader(user: controller.userProfile.value),
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: GameCarousel(games: controller.pokerGames),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Obx(
                      () => BottomNavBar(
                        selectedIndex: controller.selectedTabIndex.value,
                        onItemSelected: controller.changeTab,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            extendBody: true,
          ),
        );
      },
    );
  }
}
