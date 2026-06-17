import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/view/home_screen/main_menu_dialog/main_menu_data.dart';

class GameStatsSectionView extends StatelessWidget {
  const GameStatsSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _SectionTitle(title: 'HANDS'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
            child: Column(
              children: [
                _StatRow(
                  label: 'Win Percentage :',
                  value: const _WinPercentageRing(
                    percentage: MainMenuData.winPercentage,
                  ),
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                Gap(20.h),
                _StatRow(
                  label: 'Hands Played :',
                  value: _StatValue('${MainMenuData.handsPlayed}'),
                ),
                Gap(18.h),
                _StatRow(
                  label: 'Hands Won :',
                  value: _StatValue('${MainMenuData.handsWon}'),
                ),
              ],
            ),
          ),
          const _SectionTitle(title: 'ACHIEVEMENTS'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
            child: Column(
              children: [
                _StatRow(
                  label: 'Best Winning Hand',
                  value: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: MainMenuData.bestWinningHand
                        .map(
                          (card) => Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: _PlayingCard(card: card),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Gap(20.h),
                _StatRow(
                  label: 'Highest Played Stakes',
                  value: const _StatValue(MainMenuData.highestPlayedStakes),
                ),
                Gap(18.h),
                _StatRow(
                  label: 'Tournament Won',
                  value: _StatValue('${MainMenuData.tournamentsWon}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 6.h),
      color: const Color(0xFF6C1111),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFFFFEEC2),
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.label,
    required this.value,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String label;
  final Widget value;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: ColorPallete.lightyellow,
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        value,
      ],
    );
  }
}

class _StatValue extends StatelessWidget {
  const _StatValue(this.value);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: ColorPallete.lightyellow,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _WinPercentageRing extends StatelessWidget {
  const _WinPercentageRing({required this.percentage});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58.r,
      height: 58.r,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 58.r,
            height: 58.r,
            child: CircularProgressIndicator(
              value: percentage / 100,
              strokeWidth: 4.r,
              backgroundColor: Colors.white.withValues(alpha: 0.9),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF6C63FF),
              ),
            ),
          ),
          Text(
            '${percentage.toInt()}%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayingCard extends StatelessWidget {
  const _PlayingCard({required this.card});

  final PlayingCardData card;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26.w,
      height: 26.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.r),
        border: Border.all(color: const Color(0xFFE8D7D7), width: 0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 2.h,
            left: 2.w,
            child: Text(
              card.rank,
              style: TextStyle(
                color: const Color(0xFFD63C3C),
                fontSize: 7.sp,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
          Positioned(
            bottom: 2.h,
            right: 2.w,
            child: RotatedBox(
              quarterTurns: 2,
              child: Text(
                card.rank,
                style: TextStyle(
                  color: const Color(0xFFD63C3C),
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              card.suit,
              style: TextStyle(
                color: const Color(0xFFD63C3C),
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
