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
import 'package:poker_club/view/custom_components/custom_snackbar.dart';
import 'package:poker_club/view/table/components/game_tables.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';
import 'package:poker_club/viewmodel/mission_controller.dart';
import 'package:poker_club/viewmodel/table_controller.dart';
import '../../viewmodel/home_controller.dart';
import '../home/components/home_header.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  final AuthController authController = Get.find<AuthController>();
  final HomeController homeController = Get.find<HomeController>();
  final TableController tableController = Get.put(TableController());
  final MissionController missionController = Get.find<MissionController>();
  final String selectedCardId = Get.arguments as String;
  GameModeCard? get selectedCard {
    final games = homeController.games;
    final gameId = selectedCardId;
    return games.firstWhereOrNull((game) => game.id == gameId);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (selectedCard?.apiUrl != null && selectedCard!.apiUrl!.isNotEmpty) {
        tableController.fetchTables(selectedCard!.apiUrl!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              AppImages.homebackground,
              fit: BoxFit.cover,
            ),
          ),
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
                  if (selectedCard != null)
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
                              selectedCard!.cardTitle.replaceAll('_', ' '),
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
                        missionController: missionController,
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
    final selectedTable = tableController.selectedTable;
    final isGameUnlocked = selectedTable != null
        ? missionController.isGameUnlocked(selectedTable.id)
        : false;
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
              onTap: () {
                if (isGameUnlocked) {
                  tableController.playSelectedTable();
                } else {
                  CustomSnackbar.show(
                    "Game Locked",
                    context,
                    type: SnackbarType.error,
                  );
                }
              },
              label: isGameUnlocked ? "PLAY NOW" : "LOCKED",
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
