class MainMenuData {
  const MainMenuData._();

  static const List<String> menuOptions = [
    'Profile',
    'Game Stats',
    'Customizations',
  ];

  static const List<String> avatarOptions = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
  ];

  static const double winPercentage = 20;
  static const int handsPlayed = 52;
  static const int handsWon = 11;
  static const String highestPlayedStakes = r'$2.5M/$5M';
  static const int tournamentsWon = 2;
  static const List<PlayingCardData> bestWinningHand = [
    PlayingCardData(rank: 'A', suit: '♦'),
    PlayingCardData(rank: '2', suit: '♦'),
    PlayingCardData(rank: '3', suit: '♦'),
  ];
}

class PlayingCardData {
  const PlayingCardData({required this.rank, required this.suit});

  final String rank;
  final String suit;
}
