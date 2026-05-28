import 'package:dio/dio.dart';
import 'package:poker_club/services/pref.dart';

class ApiService {
  const ApiService._();

  // Basic
  static const tenantId = 'fc5239e3-f0a5-4e42-aceb-57c18f2b639a';
  static const String pmsApiUrl =
      'https://pms-lukkywin-api-twkwng2veq-em.a.run.app/api';

  // Auth
  static const String loginEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/signin';
  static const String registerEndpoint =
      '$pmsApiUrl/tenant/$tenantId/players/rummy-signup';
  static const String meEndpoint = '$pmsApiUrl/tenant/$tenantId/players/me';

  static Future<T> sendPmsRequest<T>(
    String endpoint, {
    String method = 'GET',
    Map<String, dynamic>? body,
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
      throw Exception(e);
    }
  }
}
