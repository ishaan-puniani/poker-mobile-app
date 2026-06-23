import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poker_club/components/app_button.dart';
import 'package:poker_club/components/countdown_text.dart';
import 'package:poker_club/resources/images.dart';
import '../../../model/game_mode_card.dart';

class GameCard extends StatelessWidget {
  final GameModeCard game;
  final VoidCallback? onTap;

  const GameCard({super.key, required this.game, this.onTap});

  String _formatTitle(String cardTitle) {
    return cardTitle.replaceAll('_', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(child: _buildCardBackground()),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTitleRibbon(),
              if (game.topOverlayTag != null &&
                  game.topOverlayTag!.tagType == "TIME" &&
                  game.topOverlayTag!.tagText.isNotEmpty)
                _buildTimerBadge(),
              Spacer(),
              _buildButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardBackground() {
    if (game.backgroundUrl != null && game.backgroundUrl!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: game.backgroundUrl!,
        fit: BoxFit.fill,
        errorWidget: (context, error, stackTrace) {
          return Image.asset(AppImages.gameCardDefaultBg, fit: BoxFit.fill);
        },
        placeholder: (context, url) {
          return Image.asset(AppImages.gameCardDefaultBg, fit: BoxFit.fill);
        },
      );
    }
    return Image.asset(AppImages.gameCardDefaultBg, fit: BoxFit.fill);
  }

  Widget _buildTitleRibbon() {
    return Padding(
      padding: EdgeInsets.fromLTRB(3.w, 2.h, 3.w, 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppImages.cardTitleRibbon, fit: BoxFit.fitWidth),
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 3.h),
            child: Text(
              _formatTitle(game.cardTitle),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.cinzel(
                color: Colors.yellow.shade600,
                fontSize: 10.sp,
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
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppImages.timerFrame, fit: BoxFit.fitWidth),
          Padding(
            padding: EdgeInsets.fromLTRB(14.w, 0, 0, .5.h),
            child: CountdownText(
              dateTime: DateTime.parse(
                game.topOverlayTag?.tagText ?? DateTime.now().toString(),
              ),
              textStyle: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 8.sp,
                fontWeight: FontWeight.bold,
              ),
              onFormatText: (countdown) {
                return "STARTS IN: $countdown";
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.w),
      child: AppButton(
        onTap: onTap,
        label: game.actionButtonText.replaceAll("_", " "),
        width: double.infinity,
      ),
    );
  }
}
