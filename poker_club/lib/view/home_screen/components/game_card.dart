import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/images.dart';
import '../../../model/poker_game.dart';

class GameCard extends StatelessWidget {
  final PokerGame game;
  final VoidCallback? onTap;

  const GameCard({super.key, required this.game, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: SvgPicture.asset(game.cardArt, fit: BoxFit.fill),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTitleRibbon(),
              if (game.badgeType == BadgeType.timer && game.badgeText != null)
                _buildTimerBadge(),
              Spacer(),
              _buildButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitleRibbon() {
    return Transform.scale(
      scale: 1.05,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppImages.cardTitleRibbon, fit: BoxFit.fitWidth),
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 2.h),
            child: Text(
              game.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorPallete.borderyellow,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerBadge() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
            scaleY: 0.75,
            child: SvgPicture.asset(AppImages.timerFrame, fit: BoxFit.fill),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(22.w, 0, 0, 0),
            child: Text(
              game.badgeText ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.w),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Material(
              child: SvgPicture.asset(
                AppImages.gameCardButton,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              game.buttonText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorPallete.richRed,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
