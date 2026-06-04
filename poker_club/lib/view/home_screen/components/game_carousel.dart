import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/poker_game.dart';
import 'game_card.dart';

class GameCarousel extends StatelessWidget {
  final List<PokerGame> games;
  final void Function(int)? onGameSelected;

  const GameCarousel({super.key, required this.games, this.onGameSelected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 240.w,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 12.h),
          scrollDirection: Axis.horizontal,
          itemCount: games.length,
          itemBuilder: (context, index) {
            return GameCard(
              game: games[index],
              onTap: () => onGameSelected?.call(index),
            );
          },
        ),
      ),
    );
  }
}
