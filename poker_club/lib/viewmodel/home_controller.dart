import 'package:get/get.dart';
import 'package:poker_club/model/game_mode_card.dart';

class HomeController extends GetxController {
  final games = <GameModeCard>[].obs;
  final selectedTabIndex = 2.obs;

  void setGames(List<GameModeCard> gameCards) {
    games.value = gameCards;
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}
