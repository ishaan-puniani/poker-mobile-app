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
  final bool active;
  final String tenantId;

  GameModeCard({
    required this.id,
    required this.backgroundUrl,
    required this.cardTitle,
    required this.actionButtonText,
    this.subtitleText,
    this.apiUrl,
    this.topOverlayTag,
    required this.active,
    required this.tenantId,
  });

  factory GameModeCard.fromJson(Map<String, dynamic> json) {
    // Use draft fields for testing
    final data = json['draft'] as Map<String, dynamic>? ?? json;

    return GameModeCard(
      id: json['id'] ?? '',
      backgroundUrl: data['backgroundUrl'],
      cardTitle: data['cardTitle'] ?? '',
      actionButtonText: GameModeActionButtonText.values.firstWhere(
        (e) => e.value == data['actionButtonText'],
        orElse: () => GameModeActionButtonText.noAction,
      ),
      subtitleText: data['subtitleText'],
      apiUrl: data['apiUrl'],
      topOverlayTag: data['topOverlayTag'] != null
          ? GameModeCardTag.fromJson(
              data['topOverlayTag'] as Map<String, dynamic>,
            )
          : null,
      active: data['active'] ?? true,
      tenantId: data['tenantId'] ?? '',
    );
  }
}
