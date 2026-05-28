import 'package:get/get.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/services/api_service.dart';
import 'package:poker_club/services/pref.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';

class AuthService {
  static Future<void> signInWithPassword(String mobile, String password) async {
    final token = await ApiService.sendPmsRequest<String>(
      ApiService.loginEndpoint,
      method: 'POST',
      body: {'mobile': mobile, 'password': password},
      useAuthToken: false,
    );

    if (token.isNotEmpty) {
      await Pref.write('token', token);

      if (Get.isRegistered<AuthController>()) {
        await Get.find<AuthController>().setToken(token);
      }

      Get.offAllNamed(AppRoutes.home);
    }

    return;
  }

  static Future<void> signOut() async {
    await Pref.remove('token');

    if (Get.isRegistered<AuthController>()) {
      await Get.find<AuthController>().logout();
    }

    Get.offAllNamed(AppRoutes.splash);
  }

  static Future<dynamic> me() async {
    final user = await ApiService.sendPmsRequest<dynamic>(
      ApiService.meEndpoint,
      method: 'GET',
    );

    return user;
  }
}
