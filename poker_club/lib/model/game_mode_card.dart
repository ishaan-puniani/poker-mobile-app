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

class GameModeCard {
  final String id;
  final String? backgroundUrl;
  final String cardTitle;
  final String actionButtonText;
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
    final draftData = json['draft'] as Map<String, dynamic>? ?? json;

    return GameModeCard(
      id: json['id'] ?? '',
      backgroundUrl: draftData['backgroundUrl'],
      cardTitle: draftData['cardTitle'] ?? '',
      actionButtonText: draftData['actionButtonText'] ?? '',
      subtitleText: draftData['subtitleText'],
      apiUrl: draftData['apiUrl'],
      topOverlayTag: draftData['topOverlayTag'] != null
          ? GameModeCardTag.fromJson(
              draftData['topOverlayTag'] as Map<String, dynamic>,
            )
          : null,
      active: draftData['active'] ?? true,
      tenantId: draftData['tenantId'] ?? '',
    );
  }
}
