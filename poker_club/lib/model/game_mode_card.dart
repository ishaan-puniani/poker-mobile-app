class GameModeCardTag {
  final String tagType;
  final String tagText;

  GameModeCardTag({required this.tagType, required this.tagText});

  factory GameModeCardTag.fromJson(Map<String, dynamic> json) {
    return GameModeCardTag(
      tagType: json['tagType'] ?? '',
      tagText: json['tagText'] ?? '',
    );
  }
}

enum GameModeActionButtonText {
  selectTable('SELECT_TABLE', 'Select Table'),
  registerNow('REGISTER_NOW', 'Register Now'),
  requestTable('REQUEST_TABLE', 'Request Table'),
  joinTable('JOIN_TABLE', 'Join Table'),
  joinNow('JOIN_NOW', 'Join Now'),
  noAction('NO_ACTION', 'No Action');

  final String value;
  final String displayText;
  const GameModeActionButtonText(this.value, [this.displayText = '']);
}

class GameModeCard {
  final String id;
  final String? backgroundUrl;
  final String cardTitle;
  final GameModeActionButtonText actionButtonText;
  final String? subtitleText;
  final String? apiUrl;
  final GameModeCardTag? topOverlayTag;
  final bool isActive;
  final String tenantId;

  GameModeCard({
    required this.id,
    required this.backgroundUrl,
    required this.cardTitle,
    required this.actionButtonText,
    this.subtitleText,
    this.apiUrl,
    this.topOverlayTag,
    this.isActive = true,
    required this.tenantId,
  });

  factory GameModeCard.fromJson(Map<String, dynamic> json) {
    return GameModeCard(
      id: json['id'] ?? '',
      backgroundUrl: json['backgroundUrl'],
      cardTitle: json['cardTitle'] ?? '',
      actionButtonText: GameModeActionButtonText.values.firstWhere(
        (e) => e.value == json['actionButtonText'],
        orElse: () => GameModeActionButtonText.noAction,
      ),
      subtitleText: json['subtitleText'],
      apiUrl: json['apiUrl'],
      topOverlayTag: json['topOverlayTag'] != null
          ? GameModeCardTag.fromJson(
              json['topOverlayTag'] as Map<String, dynamic>,
            )
          : null,
      isActive: json['active'] ?? true,
      tenantId: json['tenantId'] ?? '',
    );
  }
}
