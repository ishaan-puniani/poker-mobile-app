import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:playing_cards_ui/playing_cards.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/icons.dart';
import 'package:poker_club/resources/images.dart';
import 'package:poker_club/view/custom_components/app_icon.dart';
import 'package:poker_club/view/custom_components/custom_icon_button.dart';
import 'package:dotted_border/dotted_border.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: ColorPallete.primarybgcolor,
        image: DecorationImage(
          image: const AssetImage(AppImages.gamebackground),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.white.withValues(alpha: 0.05),
            BlendMode.srcATop,
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
                child: Container(
                  color: Colors.black.withValues(alpha: 0.2),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 8.h,
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        "LOGO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CustomIconButton(icon: AppIcons.fullscreen, onTap: () {}),
                    ],
                  ),
                ),
              ),
              _buildRoundTable(),
              _buildOptions(),
              _buildControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundTable() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 590.r,
        height: 250.r,
        margin: EdgeInsets.fromLTRB(0, 48.h, 0, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(AppImages.gameRoundTable),
            fit: BoxFit.contain,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -60.w,
              left: 0,
              right: 0,
              child: Align(
                child: Image.asset(
                  AppImages.casinoDealerFemale,
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                  width: 64.w,
                  height: 94.h,
                ),
              ),
            ),
            Positioned(top: -30.h, left: 80.w, child: _buildEmptySeat()),
            Positioned(
              top: -30.h,
              right: 80.w,
              child: _buildPlayerAvatar(imagePath: AppImages.playerAvatar1),
            ),
            Positioned(
              bottom: 10.h,
              left: 20.w,
              child: _buildPlayerAvatar(
                imagePath: AppImages.playerAvatar2,
                isReversed: true,
              ),
            ),
            Positioned(
              bottom: 10.h,
              right: 20.w,
              child: _buildPlayerAvatar(
                imagePath: AppImages.playerAvatar3,
                isReversed: true,
              ),
            ),
            Positioned(
              bottom: -10.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPlayerAvatar(
                    imagePath: AppImages.playerAvatar4,
                    avatarSize: 96,
                    isReversed: true,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 35.h,
              left: 0,
              right: 0,
              child: Align(
                // alignment: Alignment.center,
                child: _buildCards(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCards() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 40.r,
          height: 55.r,
          child: PlayingCardView(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.r),
            ),
            card: PlayingCard(Suit.diamonds, CardValue.ace),
          ),
        ),
        SizedBox(
          width: 40.r,
          height: 55.r,
          child: PlayingCardView(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.r),
            ),
            card: PlayingCard(Suit.clubs, CardValue.five),
          ),
        ),
        SizedBox(
          width: 40.r,
          height: 55.r,
          child: PlayingCardView(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.r),
            ),
            card: PlayingCard(Suit.hearts, CardValue.ten),
          ),
        ),
        _buildEmptyCard(),
        _buildEmptyCard(),
      ],
    );
  }

  Widget _buildEmptyCard() {
    return Container(
      width: 36.r,
      height: 52.r,
      padding: EdgeInsets.all(1.5.r),
      child: Material(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(4.r),
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(2.r),
            strokeWidth: 1,
            color: Colors.white.withValues(alpha: 0.2),
            dashPattern: [4, 3],
          ),
          child: SizedBox(width: 35.r, height: 50.r),
        ),
      ),
    );
  }

  Widget _buildEmptySeat({bool isReversed = false}) {
    List<Widget> items = [
      Material(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(100.r),
        child: DottedBorder(
          options: CircularDottedBorderOptions(
            color: Colors.white.withValues(alpha: 0.2),
            strokeWidth: 2,
            dashPattern: [7, 6],
          ),
          child: SizedBox(
            width: 60.r,
            height: 60.r,
            child: Icon(
              Icons.add,
              color: Colors.white.withValues(alpha: 0.7),
              size: 30.r,
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1.5,
          ),
        ),
        child: Text(
          "Sit Here",
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ];
    return Column(
      spacing: 4.h,
      children: isReversed ? items.reversed.toList() : items,
    );
  }

  Widget _buildPlayerAvatar({
    required String imagePath,
    double avatarSize = 64,
    bool isReversed = false,
  }) {
    List<Widget> items = [
      Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.contain,
            width: avatarSize.r,
            height: avatarSize.r,
          ),
          Text(
            "\$6,850,895",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: ColorPallete.richRed,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: ColorPallete.borderyellow.withValues(alpha: 0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100.r),
              child: Transform.scale(
                scale: 1.1.r,
                child: AppIcon(AppIcons.gameCoin, size: 12.r),
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              '\$250k',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ];

    return Column(
      spacing: 2.h,
      children: isReversed ? items.reversed.toList() : items,
    );
  }

  Widget _buildOptions() {
    return Positioned(
      bottom: 24.r,
      left: 24.r,
      child: Row(
        spacing: 12.w,
        children: [
          CustomIconButton.netral(icon: AppIcons.menu, onTap: () {}),
          CustomIconButton.netral(icon: AppIcons.messageBox, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Positioned(
      right: 24.r,
      bottom: 24.r,
      child: Column(
        spacing: 10.h,
        children: [
          _buildControlButton(
            label: "Fold",
            icon: AppIcons.close,
            themeColor: Colors.red,
            iconSize: 22.sp,
            onTap: () {},
          ),
          _buildControlButton(
            label: "Check",
            icon: AppIcons.minus,
            themeColor: Colors.yellow,
            iconSize: 22.sp,
            onTap: () {},
          ),
          _buildControlButton(
            label: "Call",
            icon: AppIcons.check,
            themeColor: Colors.cyan,
            iconSize: 28.sp,
            onTap: () {},
          ),
          _buildControlButton(
            label: "Raise",
            icon: AppIcons.doubleChevronUp,
            themeColor: Colors.purple,
            iconSize: 28.sp,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildControlButton({
    required String label,
    required String icon,
    required double iconSize,
    required Color themeColor,
    required void Function() onTap,
  }) {
    return Column(
      spacing: 2.h,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        CustomIconButton.themed(
          icon: icon,
          themeColor: themeColor,
          iconSize: iconSize,
          onTap: onTap,
        ),
      ],
    );
  }
}
