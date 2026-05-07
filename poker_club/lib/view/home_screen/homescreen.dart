import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/utils/show_name_input_dialog.dart';
import '../../viewmodel/home_controller.dart';
import 'components/home_header.dart';
import 'components/game_carousel.dart';
import 'components/bottom_nav_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showInputNameDialog(context, (name) {});
    });
  }

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
                      () => HomeHeader(
                        user: controller.userProfile.value,
                        showBuyButton: true,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    left: 0,
                    right: 0,
                    child: GameCarousel(
                      games: controller.pokerGames,
                      onGameSelected: (index) {
                        controller.selectGame(index);
                        Get.toNamed(AppRoutes.tableScreen);
                      },
                    ),
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
