import 'package:get/get.dart';
import 'package:poker_club/model/game_mode_card.dart';

class HomeController extends GetxController {
  final _games = <GameModeCard>[].obs;
  List<GameModeCard> get games =>
      _games.where((game) => game.isActive).toList();
  final selectedTabIndex = 2.obs;

  void setGames(List<GameModeCard> gameCards) {
    _games.value = gameCards;
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}
