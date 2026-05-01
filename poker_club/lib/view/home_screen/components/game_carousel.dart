import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../model/poker_game.dart';
import 'game_card.dart';

class GameCarousel extends StatelessWidget {
  final List<PokerGame> games;

  const GameCarousel({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.w,
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 12.h),
        crossAxisCount: 5,
        mainAxisExtent: 200.w,
        children: List.generate(games.length, (index) {
          return GameCard(game: games[index]);
        }),
      ),
    );
  }
}
