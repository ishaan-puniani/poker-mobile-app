import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/view/custom_components/player_name_input_dialog.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';
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
  final List<NavigationItem> navigationItems = [
    NavigationItem(AppIcons.club, 'RANKS'),
    NavigationItem(AppIcons.calender, 'MISSION'),
    NavigationItem(
      AppIcons.dices,
      'LUCKY SPIN',
      imageAsset: AppImages.footerSpinIcon,
      isCenter: true,
    ),
    NavigationItem(
      AppIcons.giftBox,
      'REWARDS',
      imageAsset: AppImages.footerRewardsIcon,
    ),
    NavigationItem(
      AppIcons.mail,
      'UPDATES',
      imageAsset: AppImages.footerUpdatesIcon,
    ),
  ];
  NavigationItem get selectedNavigationItem =>
      navigationItems[homeController.selectedTabIndex.value];

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = Get.find<AuthController>().user.value;
      if (user?.firstName == null || user!.firstName.isEmpty) {
        showInputNameDialog((name) {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Stack(
          children: [
            SvgPicture.asset(
              AppImages.homebackground,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: HomeHeader(
                        showBuyButton: true,
                        showHelpButton: true,
                        showSettingsButton: true,
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
                          onItemSelected: (index) {
                            if (index == 0) {
                              Get.toNamed(AppRoutes.leaderboardScreen);
                              return;
                            }
                            if (index == 1) {
                              Get.toNamed(AppRoutes.missionScreen);
                              return;
                            }
                            controller.changeTab(index);
                          },
                          navigationItems: navigationItems,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              extendBody: true,
            ),
          ],
        );
      },
    );
  }
}
