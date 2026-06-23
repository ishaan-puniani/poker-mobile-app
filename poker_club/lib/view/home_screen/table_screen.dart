import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/components/app_button.dart';
import 'package:poker_club/model/poker_game.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
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
                  showCloseButton: true,
                  onClose: () => Get.back(),
                ),
              ),
              body: Center(
                child: Column(
                  children: [
                    Gap(8.h),
                    SizedBox(
                      height: 20.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.cardTitleRibbon,
                            fit: BoxFit.fitWidth,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 2.h),
                            child: Text(
                              selectedGame.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cinzel(
                                color: ColorPallete.borderyellow,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => GameTables(
                          tables: homeController.tables,
                          selectedIndex: controller.selectedTableIndex.value,
                          onTableSelected: controller.selectTable,
                        ),
                      ),
                    ),
                    _buildBottomWidget(controller),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomWidget(HomeController controller) {
    return Padding(
      padding: EdgeInsets.fromLTRB(32.w, 0, 32.w, 8.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                SvgPicture.asset(
                  AppImages.tableSettingsButtonFrame,
                  width: 135.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 36.w),
                  child: Text(
                    "TABLE SETTINGS",
                    style: TextStyle(
                      color: Colors.yellow.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: AppButton(
              onTap: () {},
              label: "PLAY NOW",
              width: 145.w,
              height: 12.h,
              labelFontSize: 13.sp,
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
