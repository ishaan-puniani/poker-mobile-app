import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/components/network_asset.dart';
import 'package:poker_club/model/game_table.dart';
import 'package:poker_club/model/user_profile.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/utils/custom_functions.dart';
import 'package:poker_club/viewmodel/mission_controller.dart';

class GameTables extends StatelessWidget {
  final List<GameTable> tables;
  final int selectedIndex;
  final Function(int index)? onTableSelected;
  final UserProfile userProfile;
  final MissionController missionController;

  const GameTables({
    super.key,
    required this.tables,
    required this.selectedIndex,
    this.onTableSelected,
    required this.userProfile,
    required this.missionController,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200.h,
        constraints: BoxConstraints(maxHeight: 200.h),
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.fromLTRB(24.w, 4.h, 24.w, 10.h),
          itemCount: tables.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onTableSelected?.call(index),
              child: _buildTableCard(index),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTableCard(int index) {
    final isSelected = index == selectedIndex;
    final currencySymbol = userProfile.currencySymbol;
    final stakes =
        "$currencySymbol${formatCoins(tables[index].smallBlind, true)}/${formatCoins(tables[index].bigBlind, true)}";
    final buyIn =
        "${formatCoins(tables[index].minBuyIn, true)}-${formatCoins(tables[index].maxBuyIn, true)}";
    final backgroundUrl = missionController.getTableBackgroundUrl(
      tables[index].id,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSelected ? 8.w : 0),
      child: Transform.scale(
        scale: isSelected ? 1 : 0.85,
        child: ColorFiltered(
          colorFilter: isSelected
              ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply)
              : ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.4),
                  BlendMode.srcATop,
                ),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: NetworkAsset(
                  assetUrl: backgroundUrl ?? '',
                  defaultAsset: AppImages.tableCardBg,
                ),
              ),
              Positioned.fill(
                top: 0.h,
                child: Column(
                  children: [
                    Container(
                      clipBehavior: Clip.none,
                      width: double.infinity,
                      height: 48.r,
                      child: SvgPicture.asset(
                        isSelected
                            ? AppImages.tableCardCrownIcon
                            : AppImages.tableCardSpadeIcon,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.w, 0, 18.w, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 24.h),
                    Text(
                      tables[index].name.toUpperCase(),
                      style: GoogleFonts.cinzel(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.7),
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      stakes,
                      style: GoogleFonts.notoSerif(
                        color: Colors.yellow.shade600,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w800,
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.7),
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: SvgPicture.asset(
                        AppImages.namePopupDivider,
                        height: 6.w,
                      ),
                    ),
                    Text(
                      "BUY IN:",
                      style: GoogleFonts.notoSerif(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.7),
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      buyIn,
                      style: GoogleFonts.notoSerif(
                        color: Colors.yellow.shade600,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            color: Colors.black.withValues(alpha: 0.7),
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                        horizontal: 6.w,
                      ),
                      child: SvgPicture.asset(
                        AppImages.namePopupDivider,
                        height: 7.w,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
