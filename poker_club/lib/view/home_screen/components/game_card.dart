import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poker_club/resources/color_pallete.dart';
import '../../../model/poker_game.dart';
import '../../custom_components/custom_button.dart';

class GameCard extends StatelessWidget {
  final PokerGame game;
  final VoidCallback? onTap;

  const GameCard({super.key, required this.game, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: ColorPallete.borderyellow.withValues(alpha: 0.8),
          width: 1.5,
        ),
        gradient: ColorPallete.gameCardBg,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.6),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 94.w,
                  child: Image.asset(
                    game.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: ColorPallete.richRed),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.h,
                    vertical: 12.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        game.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        game.stakesText,
                        style: TextStyle(
                          color: ColorPallete.borderyellow,
                          fontSize: 12.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.w),
                      CustomButton(
                        onPressed: game.isEnabled ? onTap : null,
                        text: game.buttonText,
                        height: 20.h,
                        radius: 40.r,
                        textStyle: TextStyle(
                          color: game.isEnabled
                              ? ColorPallete.richRed
                              : Colors.white54,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp,
                        ),
                        backgroundGradient: game.isEnabled
                            ? ColorPallete.rightbuttongradient
                            : null,
                        backgroundColor: game.isEnabled ? null : Colors.white24,
                      ),
                    ],
                  ),
                ),

                // Badges
              ],
            ),
            if (game.badgeType != BadgeType.none)
              Positioned(top: 4.h, right: 6.w, child: _buildBadge()),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge() {
    Color bgColor;
    switch (game.badgeType) {
      case BadgeType.comingSoon:
        bgColor = Colors.blue.shade700;
        break;
      case BadgeType.vipOnly:
      case BadgeType.timer:
        bgColor = Colors.red.shade700;
        break;
      default:
        bgColor = Colors.transparent;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        game.badgeText ?? '',
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
