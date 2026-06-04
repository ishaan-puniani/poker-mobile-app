import 'package:get/get.dart';
import 'package:poker_club/model/game_table.dart';
import 'package:poker_club/resources/images.dart';
import '../model/poker_game.dart';

class HomeController extends GetxController {
  final pokerGames = <PokerGame>[
    PokerGame(
      title: 'TEXAS HOLD\'EM',
      stakesText: 'Stakes: 50K / 100K',
      imagePath: AppImages.gameCardTexasHoldemThumbnail,
      buttonText: 'SELECT TABLE',
    ),
    PokerGame(
      title: 'TOURNAMENT',
      stakesText: 'Buy-in: 10K',
      imagePath: AppImages.gameCardTournamentThumbnail,
      buttonText: 'REGISTER NOW',
      badgeType: BadgeType.timer,
      badgeText: 'STARTS IN: 30M',
    ),
    PokerGame(
      title: 'PRIVATE TABLE',
      stakesText: 'Prize Pool: 5B Chips',
      imagePath: AppImages.gameCardPrivateTableThumbnail,
      buttonText: 'JOIN TABLE',
    ),
    PokerGame(
      title: 'HIGH STAKES',
      stakesText: 'Min Buy-in: 10M',
      imagePath: AppImages.gameCardHighStakesThumbnail,
      buttonText: 'GO NOW',
      badgeType: BadgeType.vipOnly,
      badgeText: 'VIP ONLY',
    ),
  ].obs;

  final List<GameTable> tables = [
    GameTable(
      name: "STAKES",
      stakes: "\$50K/100K",
      buyIn: "2M-5M",
      maxCharge: 2,
      challenges: 2,
    ),
    GameTable(
      name: "STAKES",
      stakes: "\$100K/250K",
      buyIn: "5M-25M",
      maxCharge: 2,
      challenges: 2,
    ),
    GameTable(
      name: "STAKES",
      stakes: "\$250K/500K",
      buyIn: "10M-50M",
      maxCharge: 2,
      challenges: 2,
    ),
    GameTable(
      name: "STAKES",
      stakes: "\$500K/1M",
      buyIn: "20M-100M",
      maxCharge: 2,
      challenges: 2,
    ),
    GameTable(
      name: "STAKES",
      stakes: "\$1M/2M",
      buyIn: "100M-500M",
      maxCharge: 2,
      challenges: 2,
    ),
  ].obs;

  final selectedTabIndex = 2.obs;
  final selectedGameIndex = 0.obs;
  final selectedTableIndex = 0.obs;

  void selectGame(int index) {
    selectedGameIndex.value = index;
  }

  void selectTable(int index) {
    selectedTableIndex.value = index;
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}
