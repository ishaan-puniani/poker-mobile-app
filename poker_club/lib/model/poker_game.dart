enum BadgeType { none, comingSoon, vipOnly, timer }

class PokerGame {
  final String title;
  final String stakesText;
  final String imagePath;
  final String cardArt;
  final String buttonText;
  final BadgeType badgeType;
  final String? badgeText; // e.g. "STARTS IN: 30M"
  final bool isEnabled;

  PokerGame({
    required this.title,
    required this.stakesText,
    required this.imagePath,
    required this.cardArt,
    required this.buttonText,
    this.badgeType = BadgeType.none,
    this.badgeText,
    this.isEnabled = true,
  });
}
