import 'package:dio/dio.dart';
import 'package:poker_club/services/pref.dart';

class ApiService {
  const ApiService._();

  // Basic
  static const tenantId = '64b0bc14-6e24-4d10-9bf3-6afb7cac3ff9';
  static const String pmsApiUrl =
      'https://pms-lukkywin-api-twkwng2veq-em.a.run.app/api';

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
        return response.data as T;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // ignore: avoid_print
      print('[$endpoint] API request error: $e');
      rethrow;
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
