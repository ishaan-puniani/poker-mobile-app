import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/game_mode_card.dart';
import 'game_card.dart';

class GameCarousel extends StatelessWidget {
  final List<GameModeCard> games;
  final void Function(int)? onGameSelected;

  const GameCarousel({super.key, required this.games, this.onGameSelected});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200.h),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 18.h),
        scrollDirection: Axis.horizontal,
        itemCount: games.length,
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        itemBuilder: (context, index) {
          final game = games[index];
          return GameCard(game: game, onTap: () => onGameSelected?.call(index));
        },
      ),
    );
  }
}
