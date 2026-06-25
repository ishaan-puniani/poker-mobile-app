class MissionGame {
  final String gameId;
  final String gameName;

  MissionGame({required this.gameId, required this.gameName});

  factory MissionGame.fromJson(Map<String, dynamic> json) {
    return MissionGame(
      gameId: json['gameId'] as String,
      gameName: json['gameName'] as String,
    );
  }
}

class MissionMilestone {
  final String id;
  final String name;
  final String? description;
  final String? backgroundUrl;
  final double reward;
  final int target;

  MissionMilestone({
    required this.id,
    required this.name,
    this.description,
    this.backgroundUrl,
    required this.reward,
    required this.target,
  });

  factory MissionMilestone.fromJson(Map<String, dynamic> json) {
    return MissionMilestone(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      backgroundUrl: json['backgroundUrl'] as String?,
      reward: json['reward'] as double,
      target: json['target'] as int,
    );
  }
}

class MissionNode {
  final String id;
  final String name;
  final String? nodeIconUrl;
  final String? nodeLevelBackgroundUrl;
  final Map<String, List<MissionGame>> eligibleGames;
  final List<MissionMilestone> milestones;

  MissionNode({
    required this.id,
    required this.name,
    this.nodeIconUrl,
    this.nodeLevelBackgroundUrl,
    required this.eligibleGames,
    required this.milestones,
  });

  factory MissionNode.fromJson(Map<String, dynamic> json) {
    return MissionNode(
      id: json['id'] as String,
      name: json['name'] as String,
      nodeIconUrl: json['nodeIconUrl'] as String?,
      nodeLevelBackgroundUrl: json['nodeLevelBackgroundUrl'] as String?,
      eligibleGames: (json['eligibleGames'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          (value as List<dynamic>)
              .map((item) => MissionGame.fromJson(item as Map<String, dynamic>))
              .toList(),
        ),
      ),
      milestones: (json['milestones'] as List<dynamic>)
          .map(
            (item) => MissionMilestone.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

enum MissionStatus {
  locked('LOCKED', 'Locked'),
  unlocked('UNLOCKED', 'Unlocked'),
  rewardClaimed('REWARD_CLAIMED', 'Reward Claimed'),
  none('NONE', 'None');

  final String value;
  final String label;

  const MissionStatus(this.value, this.label);
}

class MissionMilestoneProgress {
  final String milestoneId;
  final String levelNodeId;
  final String name;
  final String? description;
  final String category;
  final int currentValue;
  final int targetValue;
  final double progressPercent;
  final MissionStatus status;
  final double rewardAmount;
  final Map<String, List<MissionGame>> unlockedGames;
  final DateTime? completedAt;

  MissionMilestoneProgress({
    required this.milestoneId,
    required this.levelNodeId,
    required this.name,
    this.description,
    required this.category,
    required this.currentValue,
    required this.targetValue,
    required this.progressPercent,
    required this.status,
    required this.rewardAmount,
    required this.unlockedGames,
    this.completedAt,
  });

  factory MissionMilestoneProgress.fromJson(Map<String, dynamic> json) {
    return MissionMilestoneProgress(
      milestoneId: json['milestoneId'] as String,
      levelNodeId: json['levelNodeId'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      category: json['category'] as String,
      currentValue: json['currentValue'] as int,
      targetValue: json['targetValue'] as int,
      progressPercent: (json['progressPercent'] as num).toDouble(),
      status: MissionStatus.values.firstWhere(
        (e) => e.value == json['status'] as String,
      ),
      rewardAmount: (json['rewardAmount'] as num).toDouble(),
      unlockedGames: (json['unlockedGames'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          (value as List<dynamic>)
              .map((item) => MissionGame.fromJson(item as Map<String, dynamic>))
              .toList(),
        ),
      ),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
    );
  }
}

class MissionProgress {
  final String userId;
  final String currentLevelName;
  final int currentLevelOrder;
  final Map<String, List<MissionGame>> unlockedGames;
  final List<MissionMilestoneProgress> milestones;
  final double totalRewardEarned;

  MissionProgress({
    required this.userId,
    required this.currentLevelName,
    required this.currentLevelOrder,
    required this.unlockedGames,
    required this.milestones,
    required this.totalRewardEarned,
  });

  factory MissionProgress.fromJson(Map<String, dynamic> json) {
    return MissionProgress(
      userId: json['userId'] as String,
      currentLevelName: json['currentLevelName'] as String,
      currentLevelOrder: json['currentLevelOrder'] as int,
      unlockedGames: (json['unlockedGames'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          (value as List<dynamic>)
              .map((item) => MissionGame.fromJson(item as Map<String, dynamic>))
              .toList(),
        ),
      ),
      milestones: (json['milestones'] as List<dynamic>)
          .map(
            (item) =>
                MissionMilestoneProgress.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
      totalRewardEarned: json['totalRewardEarned'] as double,
    );
  }

  factory MissionProgress.empty() {
    return MissionProgress(
      userId: '',
      currentLevelName: '',
      currentLevelOrder: 0,
      unlockedGames: {},
      milestones: [],
      totalRewardEarned: 0.0,
    );
  }
}
