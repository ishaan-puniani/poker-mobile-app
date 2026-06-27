import 'package:get/get.dart';
import 'package:poker_club/model/mission.dart';
import 'package:poker_club/services/game_service.dart';

class MissionController extends GetxController {
  final String gameType = 'POKER';
  final _missionsNodes = <MissionNode>[].obs;
  List<MissionNode> get missionsNodes => _missionsNodes.toList();
  MissionNode? get selectedNode =>
      (selectedNodeIndex.value >= 0 &&
          selectedNodeIndex.value < _missionsNodes.length)
      ? _missionsNodes[selectedNodeIndex.value]
      : null;
  final _missionsProgress = MissionProgress.empty().obs;

  final selectedNodeIndex = 0.obs;

  void setMissions(List<MissionNode> missionNodes) {
    _missionsNodes.value = missionNodes;
  }

  void selectNode(int index) {
    if (index >= 0 && index < _missionsNodes.length) {
      selectedNodeIndex.value = index;
    }
  }

  Future<void> fetchMissions() async {
    await GameService.fetchMissions()
        .then((missions) {
          setMissions(missions);
        })
        .catchError((error) {
          // Handle error
          // print('Error fetching missions: $error');
        });
  }

  Future<void> fetchMissionsProgress(String userId) async {
    await GameService.fetchMissionsProgress(userId)
        .then((missionProgress) {
          _missionsProgress.value = missionProgress;
        })
        .catchError((error) {
          // Handle error
          // print('Error fetching missions: $error');
        });
  }

  String? getTableBackgroundUrl(String gameId) {
    return _missionsNodes
        .firstWhereOrNull(
          (node) =>
              node.eligibleGames[gameType]?.firstWhereOrNull(
                (game) => game.gameId == gameId,
              ) !=
              null,
        )
        ?.nodeLevelBackgroundUrl;
  }

  bool isGameUnlocked(String gameId) {
    var isUnlocked =
        _missionsProgress.value.unlockedGames[gameType]?.any(
          (game) => game.gameId == gameId,
        ) ==
        true;
    if (!isUnlocked) {
      isUnlocked =
          _missionsProgress.value.milestones.any(
            (milestone) =>
                milestone.unlockedGames[gameType]?.any(
                  (game) => game.gameId == gameId,
                ) ==
                true,
          ) ==
          true;
    }
    return isUnlocked;
  }

  MissionStatus getMilestoneProgressStatus(String milestoneId) {
    return _missionsProgress.value.milestones
            .firstWhereOrNull(
              (milestone) => milestone.milestoneId == milestoneId,
            )
            ?.status ??
        MissionStatus.locked;
  }
}
