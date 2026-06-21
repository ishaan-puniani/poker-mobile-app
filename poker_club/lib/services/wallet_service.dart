import 'package:poker_club/services/api_service.dart';

class WalletService {
  const WalletService._();

  /// Returns the player's live wallet balance for [currency]
  /// (e.g. 'INR' for cash or 'PC' for practice coins).
  ///
  /// Hits the wapas `get-detailed-transaction-profile` endpoint, which
  /// responds with a `cash` field. Returns 0 on any failure.
  static Future<double> fetchBalance({
    required String playerId,
    required String currency,
  }) async {
    try {
      final res = await ApiService.sendPmsRequest<Map<String, dynamic>>(
        ApiService.walletBalanceEndpoint,
        method: 'POST',
        body: {'playerId': playerId, 'currency': currency},
        useAuthToken: false,
      );
      final valueType = res['valueType'];
      if (valueType != 'coin') {
        return (res['cash'] ?? 0).toDouble();
      } else {
        return (res['coins'] ?? 0).toDouble();
      }
    } catch (_) {
      return 0.0;
    }
  }
}
