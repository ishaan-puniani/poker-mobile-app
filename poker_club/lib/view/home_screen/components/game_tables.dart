import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poker_club/model/game_table.dart';
import 'package:poker_club/model/user_profile.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/utils/custom_functions.dart';

class GameTables extends StatelessWidget {
  final List<GameTable> tables;
  final int selectedIndex;
  final Function(int index)? onTableSelected;
  final UserProfile userProfile;

  const GameTables({
    super.key,
    required this.tables,
    required this.selectedIndex,
    this.onTableSelected,
    required this.userProfile,
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
        "BUY IN: ${formatCoins(tables[index].minBuyIn, true)}-${formatCoins(tables[index].maxBuyIn, true)}";
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSelected ? 8.w : 0),
      child: Transform.scale(
        scale: isSelected ? 1 : 0.85,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Image.asset(AppImages.tableCardBg, fit: BoxFit.fill),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 12.h),
                Text(
                  'STAKES',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  stakes,
                  style: TextStyle(
                    color: Colors.yellow.shade700,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  buyIn,
                  style: TextStyle(
                    color: Colors.yellow.shade700,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: SvgPicture.asset(
                    AppImages.namePopupDivider,
                    height: 9.w,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.tableCardChargeIcon,
                      width: 18.w,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "Max Charge",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      color: Colors.yellow.shade700.withValues(alpha: 0.4),
                      width: 1.w,
                      height: 14.h,
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                    ),
                    Text(
                      "+${tables[index].serviceCharge}LV",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
