import 'package:poker_club/services/api_service.dart';

class PlayerService {
  static Future<String> updatePlayerName(String name) async {
    final msg = await ApiService.sendPmsRequest<String>(
      ApiService.playerUpdateNameEndpoint,
      method: 'PUT',
      body: {'name': name},
    );
    return msg;
  }
}
