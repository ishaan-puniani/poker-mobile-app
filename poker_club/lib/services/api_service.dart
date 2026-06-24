import 'package:dio/dio.dart';
import 'package:poker_club/services/auth_service.dart';
import 'package:poker_club/services/pref.dart';

class ApiService {
  const ApiService._();

  /// Guards against firing multiple logouts when several authenticated
  /// requests fail with an expired token at the same time.
  static bool _handlingExpiredToken = false;

  // Basic
  static const tenantId = 'f8ff9f87-d315-4323-86d2-14bcae0b8109';
  static const String pmsApiUrl =
      'https://pms-lukkywin-api-twkwng2veq-em.a.run.app/api';
  static const String gmsApiUrl =
      'https://poker-api-twkwng2veq-em.a.run.app/api';

  // Auth
  static const String registerEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/rummy-signup';
  static const String registerOtpVerifyEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/signup-verify';
  static const String loginEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/signin';
  static const String otpLoginEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/rummy-signin';
  static const String otpVerifyEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/verify-otp';
  static const String meEndpoint = '$pmsApiUrl/tenant/$tenantId/players/me';
  static const String forgotPasswordEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/forgot-password';
  static const String verifyResetPasswordOtpEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/verify-resetPassword-otp';
  static const String resetPasswordEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/reset-password';

  // Player
  static const String playerUpdateNameEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/update-name';
  static const String playerUpdateUsernameEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/update-userName';
  static const String playerAddAvatarEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/add-avatar';

  // Wallet
  static const String walletBalanceEndpoint =
      '$pmsApiUrl/tenant/$tenantId/wapas/balance/get-detailed-transaction-profile';

  // Game
  static const String gameModeCardsEndpoint = '$gmsApiUrl/game-mode-cards';

  static Future<T> sendPmsRequest<T>(
    String endpoint, {
    String method = 'GET',
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool useAuthToken = true,
  }) async {
    try {
      final Map<String, dynamic> headers = {};
      if (useAuthToken) {
        final token = await Pref.read('token');
        if (token.isNotEmpty) {
          headers['Authorization'] = 'Bearer $token';
        }
      }
      final response = await Dio().request(
        endpoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(method: method, headers: headers),
      );

      if (response.statusCode == 200) {
        // Some endpoints return 200 with a success:false / errorCode body.
        if (useAuthToken) _checkExpiredToken(response.data);
        return response.data as T;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (useAuthToken && e is DioException) {
        _checkExpiredToken(e.response?.data);
      }
      // ignore: avoid_print
      print('[$endpoint] API request error: $e');
      rethrow;
    }
  }

  static Future<T> sendGmsRequest<T>(
    String endpoint, {
    String method = 'GET',
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool useAuthToken = true,
  }) async {
    try {
      final Map<String, dynamic> headers = {};
      if (useAuthToken) {
        final token = await Pref.read('token');
        if (token.isNotEmpty) {
          headers['Authorization'] = 'Bearer $token';
        }
      }
      final response = await Dio().request(
        endpoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(method: method, headers: headers),
      );

      if (response.statusCode == 200) {
        return response.data as T;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // ignore: avoid_print
      print('[$endpoint] GMS API request error: $e');
      rethrow;
    }
  }

  /// Logs the user out when an authenticated request reports an expired/invalid
  /// session token (errorCode `EXPIRED_TOKEN`).
  static void _checkExpiredToken(dynamic data) {
    if (data is! Map) return;
    final errorCode = data['errorCode'];
    if (errorCode == 'EXPIRED_TOKEN' && !_handlingExpiredToken) {
      _handlingExpiredToken = true;
      AuthService.signOut().whenComplete(() => _handlingExpiredToken = false);
    }
  }

  static String? getErrorMessage(Object error) {
    if (error is DioException) {
      if (error.response != null) {
        final statusCode = error.response?.statusCode;
        final responseData = error.response?.data;
        // ignore: avoid_print
        print('API Error - Status Code: $statusCode, Response: $responseData');
        return responseData is Map<String, dynamic> &&
                responseData['message'] != null
            ? responseData['message'] as String
            : responseData is String
            ? responseData
            : null;
      }
    } else {
      final msg = error.toString();
      // ignore: avoid_print
      print('API Error: $msg');
      return msg.isEmpty ? null : msg;
    }
    return null;
  }
}
