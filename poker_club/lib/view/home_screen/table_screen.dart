import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/model/poker_game.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/view/custom_components/custom_button.dart';
import 'package:poker_club/view/home_screen/components/game_tables.dart';
import '../../viewmodel/home_controller.dart';
import 'components/home_header.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final HomeController homeController = Get.put(HomeController());
  PokerGame get selectedGame =>
      homeController.pokerGames[homeController.selectedGameIndex.value];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            gradient: ColorPallete.primarybgcolor,
            image: DecorationImage(
              image: AssetImage(AppImages.tableScreenBackground),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              colorFilter: ColorFilter.mode(
                ColorPallete.darkRed.withValues(alpha: 0.7),
                BlendMode.color,
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
                        showHelpButton: true,
                        showCloseButton: true,
                        onClose: () => Get.back(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 48.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Column(
                      children: [
                        Text(
                          selectedGame.title,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Obx(
                          () => GameTables(
                            tables: homeController.tables,
                            selectedIndex: controller.selectedTableIndex.value,
                            onTableSelected: controller.selectTable,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.r),
                      child: CustomButton(
                        onPressed: () {
                          Get.toNamed(
                            AppRoutes.gameScreen,
                            arguments: {
                              'game': selectedGame,
                              'table': homeController
                                  .tables[controller.selectedTableIndex.value],
                            },
                          );
                        },
                        text: "PLAY NOW",
                        width: 135.w,
                        height: 20.h,
                        radius: 100,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                        backgroundGradient: ColorPallete.rightbuttongradient,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 16.r, left: 16.r),
                      child: CustomButton(
                        onPressed: () {},
                        text: "TABLE SETTINGS",
                        width: 155.w,
                        height: 20.h,
                        radius: 100,
                        textStyle: TextStyle(
                          color: Colors.yellow.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                        borderWidth: 1,
                        borderColor: Colors.yellow.shade700,
                        backgroundColor: Colors.transparent,
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

  Widget buildBottomNavBar(HomeController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(onPressed: () {}, text: 'TABLE SETTINGS'),
          CustomButton(onPressed: () {}, text: 'PLAY NOW'),
        ],
      ),
    );
  }
}
