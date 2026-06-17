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

  static Future<String> updatePlayerUsername(
    String playerId,
    String username,
  ) async {
    final msg = await ApiService.sendPmsRequest<String>(
      '${ApiService.playerUpdateUsernameEndpoint}/$playerId',
      method: 'PUT',
      body: {'userName': username},
    );
    return msg;
  }

  static Future<String> addPlayerAvatar(
    String playerId,
    String avatarId,
  ) async {
    final msg = await ApiService.sendPmsRequest<String>(
      ApiService.playerAddAvatarEndpoint,
      method: 'POST',
      body: {'playerId': playerId, 'avatarId': avatarId},
    );
    return msg;
  }
}
