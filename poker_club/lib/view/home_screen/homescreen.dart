import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
    NavigationItem(AppImages.footerRankingIcon, 'RANKS'),
    NavigationItem(AppImages.footerMissionIcon, 'MISSION'),
    NavigationItem(AppImages.footerSpinIcon, 'LUCKY SPIN'),
    NavigationItem(AppImages.footerRewardsIcon, 'REWARDS'),
    NavigationItem(AppImages.footerUpdatesIcon, 'UPDATES'),
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
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(AppImages.homebackground),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50.h),
                child: HomeHeader(
                  showBuyButton: true,
                  showHelpButton: true,
                  showSettingsButton: true,
                ),
              ),
              body: GameCarousel(
                games: controller.pokerGames,
                onGameSelected: (index) {
                  controller.selectGame(index);
                  Get.toNamed(AppRoutes.tableScreen);
                },
              ),
              // extendBody: true,
              bottomNavigationBar: Obx(
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
        );
      },
    );
  }
}
