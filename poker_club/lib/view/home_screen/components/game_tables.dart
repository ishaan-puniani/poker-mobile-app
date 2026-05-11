import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poker_club/model/game_table.dart';
import 'package:poker_club/resources/color_pallete.dart';

class GameTables extends StatelessWidget {
  final List<GameTable> tables;
  final int selectedIndex;
  final Function(int index)? onTableSelected;

  const GameTables({
    super.key,
    required this.tables,
    required this.selectedIndex,
    this.onTableSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.w,
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(16.w, 10.h, 16.w, 10.h),
        itemCount: tables.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTableSelected?.call(index),
            child: Transform.scale(
              scale: index == selectedIndex ? 1.05 : 0.95,
              child: Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
                width: 175.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.yellow.shade700, width: 1),
                  gradient: ColorPallete.primarybgcolorVertical,
                  boxShadow: [
                    if (index == selectedIndex)
                      BoxShadow(
                        color: Colors.yellow.shade700.withValues(alpha: 0.5),
                        blurRadius: 12.r,
                        spreadRadius: 4.r,
                        offset: Offset(0.w, 0.h),
                      ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 12.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        tables[index].name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        tables[index].stakes,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.yellow.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "BUY IN: ${tables[index].buyIn}",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.yellow.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Spacer(),
                      buildCardTile(
                        label: "Challenges",
                        value: "${tables[index].challenges}",
                      ),
                      buildCardTile(
                        label: "Max Charge",
                        value: "+${tables[index].maxCharge}LV",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildCardTile({required String label, required String value}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorPallete.brown,
        border: Border(
          top: BorderSide(color: Colors.yellow.shade700, width: 0.3),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 16.r),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
