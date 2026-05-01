import 'package:get/get.dart';
import 'package:poker_club/resources/images.dart';
import '../model/user_profile.dart';
import '../model/poker_game.dart';

class HomeController extends GetxController {
  final userProfile = UserProfile(
    username: 'HIGH_ROLLER_99',
    tier: 'Pro League',
    coins: 202461668,
    avatarUrl: 'https://i.pravatar.cc/150?img=47', // Test avatar
  ).obs;

  final pokerGames = <PokerGame>[
    PokerGame(
      title: 'OMAHA 5',
      stakesText: 'Stakes: 100K / 200K',
      imagePath: AppImages.gameCardOmaha5Thumbnail,
      buttonText: 'JOIN TABLE',
      badgeType: BadgeType.comingSoon,
      badgeText: 'Coming Soon',
    ),
    PokerGame(
      title: 'HIGH STAKES',
      stakesText: 'Min Buy-in: 10M',
      imagePath: AppImages.gameCardHighStakesThumbnail,
      buttonText: 'GO NOW',
      badgeType: BadgeType.vipOnly,
      badgeText: 'VIP ONLY',
    ),
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
  ].obs;

  final selectedTabIndex = 2.obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}
