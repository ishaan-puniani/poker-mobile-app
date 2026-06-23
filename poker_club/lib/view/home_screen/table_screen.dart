import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/components/app_button.dart';
import 'package:poker_club/model/game_mode_card.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/view/home_screen/components/game_tables.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';
import 'package:poker_club/viewmodel/table_controller.dart';
import '../../viewmodel/home_controller.dart';
import 'components/home_header.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final AuthController authController = Get.put(AuthController());
  final HomeController homeController = Get.put(HomeController());
  final TableController tableController = Get.put(TableController());
  final String selectedGameId = Get.arguments as String;
  GameModeCard? get selectedGame {
    final games = homeController.games;
    final gameId = selectedGameId;
    return games.firstWhereOrNull((game) => game.id == gameId);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (selectedGame?.apiUrl != null && selectedGame!.apiUrl!.isNotEmpty) {
        tableController.fetchTables(selectedGame!.apiUrl!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
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
                  if (selectedGame != null)
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
                              selectedGame!.cardTitle.replaceAll('_', ' '),
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
                    child: Obx(() {
                      if (tableController.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorPallete.borderyellow,
                          ),
                        );
                      }
                      if (tableController.tables.isEmpty) {
                        return Center(
                          child: Text(
                            'No tables available',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        );
                      }
                      return GameTables(
                        tables: tableController.tables,
                        selectedIndex: tableController.selectedTableIndex.value,
                        onTableSelected: tableController.selectTable,
                        userProfile: authController.user.value!,
                      );
                    }),
                  ),
                  _buildBottomWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomWidget() {
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
              onTap: () => tableController.playSelectedTable(),
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
