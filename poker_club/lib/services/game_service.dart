import 'package:poker_club/model/game_mode_card.dart';
import 'package:poker_club/model/game_table.dart';
import 'package:poker_club/services/api_service.dart';

class GameService {
  const GameService._();

  static Future<List<GameModeCard>> fetchGameCards() async {
    try {
      final response = await ApiService.sendGmsRequest<Map<String, dynamic>>(
        ApiService.gameModeCardsEndpoint,
      );

      final dataList = response['data'] as List<dynamic>?;
      if (dataList == null || dataList.isEmpty) {
        return [];
      }

      return dataList
          .map((item) => GameModeCard.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // ignore: avoid_print
      print('[GameService] Error fetching game cards: $e');
      return [];
    }
  }

  static Future<List<GameTable>> fetchTables(String apiUrl) async {
    try {
      final response = await ApiService.sendGmsRequest<List<dynamic>>(apiUrl);
      return response
          .map((item) => GameTable.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // ignore: avoid_print
      print('[GameService] Error fetching tables: $e');
      return [];
    }
  }
}
