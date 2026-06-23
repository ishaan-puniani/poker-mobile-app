import 'package:get/get.dart';
import 'package:poker_club/model/game_mode_card.dart';
import 'package:poker_club/model/game_table.dart';

class HomeController extends GetxController {
  final games = <GameModeCard>[].obs;

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
  final selectedTableIndex = 0.obs;

  void setGames(List<GameModeCard> gameCards) {
    games.value = gameCards;
  }

  void selectTable(int index) {
    selectedTableIndex.value = index;
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}
