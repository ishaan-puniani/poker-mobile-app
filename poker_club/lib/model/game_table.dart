class GameTable {
  final String id;
  final String name;
  final double smallBlind;
  final double bigBlind;
  final double minBuyIn;
  final double maxBuyIn;
  final int serviceCharge;
  final double entryFee;
  final bool isActive;

  GameTable({
    required this.id,
    required this.name,
    required this.smallBlind,
    required this.bigBlind,
    required this.minBuyIn,
    required this.maxBuyIn,
    required this.serviceCharge,
    required this.entryFee,
    this.isActive = true,
  });

  factory GameTable.fromJson(Map<String, dynamic> json) {
    return GameTable(
      id: json['id'] ?? '',
      name: json['tableName'] ?? '',
      smallBlind: (json['smallBlind'] as num?)?.toDouble() ?? 0.0,
      bigBlind: (json['bigBlind'] as num?)?.toDouble() ?? 0.0,
      minBuyIn: (json['minBuyIn'] as num?)?.toDouble() ?? 0.0,
      maxBuyIn: (json['maxBuyIn'] as num?)?.toDouble() ?? 0.0,
      serviceCharge: (json['serviceCharge'] as num?)?.toInt() ?? 0,
      entryFee: (json['entryFee'] as num?)?.toDouble() ?? 0.0,
      isActive: json['active'] ?? true,
    );
  }
}
