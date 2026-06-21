import 'package:get/get.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/services/api_service.dart';
import 'package:poker_club/services/pref.dart';
import 'package:poker_club/view/custom_components/custom_snackbar.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';

class AuthService {
  static Future<void> signUp(
    String mobile,
    String password, {
    String referredBy = '',
  }) async {
    final res = await ApiService.sendPmsRequest<Map<String, dynamic>>(
      ApiService.registerEndpoint,
      method: 'POST',
      body: {
        'mobile': mobile,
        'password': password,
        'referredBy': referredBy,
        'enabledGames': ['poker'],
      },
      useAuthToken: false,
    );
    if (res['otpNeeded'] == true || res['success'] != false) {
      final msg =
          res['message'] ??
          'Registration successful. Please verify OTP sent to your mobile.';
      // ignore: use_build_context_synchronously
      if (Get.context != null) {
        CustomSnackbar.show(msg, Get.context!, type: SnackbarType.success);
      }
      Get.toNamed(
        AppRoutes.otpVerificationScreen,
        arguments: {'mobile': mobile, 'verify_for': 'signup'},
      );
    } else {
      throw res['message'] ?? 'Registration failed. Please try again.';
    }
  }

  static Future<void> verifyOtpForSignUp(String mobile, String otp) async {
    final token = await ApiService.sendPmsRequest<String>(
      ApiService.registerOtpVerifyEndpoint,
      method: 'POST',
      body: {'mobile': mobile, 'otp': otp},
      useAuthToken: false,
    );

    if (token.isNotEmpty) {
      if (Get.isRegistered<AuthController>()) {
        await Get.find<AuthController>().setToken(token);
      } else {
        await Pref.write('token', token);
      }

      Get.offAllNamed(AppRoutes.home);
    }
  }

  static Future<void> signInWithPassword(String mobile, String password) async {
    final token = await ApiService.sendPmsRequest<String>(
      ApiService.loginEndpoint,
      method: 'POST',
      body: {'mobile': mobile, 'password': password},
      useAuthToken: false,
    );

    if (token.isNotEmpty) {
      if (Get.isRegistered<AuthController>()) {
        await Get.find<AuthController>().setToken(token);
      } else {
        await Pref.write('token', token);
      }

      Get.offAllNamed(AppRoutes.home);
    }

    return;
  }

  static Future<String> signInWithOtp(String mobile) async {
    final msg = await ApiService.sendPmsRequest<String>(
      ApiService.otpLoginEndpoint,
      method: 'POST',
      body: {'mobile': mobile},
      useAuthToken: false,
    );
    return msg;
  }

  static Future<void> verifyOtpForSignIn(String mobile, String otp) async {
    final token = await ApiService.sendPmsRequest<String>(
      ApiService.otpVerifyEndpoint,
      method: 'POST',
      body: {'mobile': mobile, 'otp': otp},
      useAuthToken: false,
    );

    if (token.isNotEmpty) {
      if (Get.isRegistered<AuthController>()) {
        await Get.find<AuthController>().setToken(token);
      } else {
        await Pref.write('token', token);
      }

      Get.offAllNamed(AppRoutes.home);
    }
  }

  static Future<void> signOut() async {
    await Pref.remove('token');

    if (Get.isRegistered<AuthController>()) {
      await Get.find<AuthController>().logout();
    }

    Get.offAllNamed(AppRoutes.splash);
  }

  static Future<dynamic> me() async {
    try {
      final user = await ApiService.sendPmsRequest<dynamic>(
        ApiService.meEndpoint,
        method: 'GET',
      );

      return user;
    } catch (e) {
      return {'success': false};
    }
  }

  static Future<void> forgotPassword(String mobile) async {
    final msg = await ApiService.sendPmsRequest<String>(
      ApiService.forgotPasswordEndpoint,
      method: 'POST',
      queryParameters: {'mobile': mobile},
      useAuthToken: false,
    );
    if (Get.context != null) {
      CustomSnackbar.show(msg, Get.context!, type: SnackbarType.success);
    }
    Get.toNamed(
      AppRoutes.otpVerificationScreen,
      arguments: {'mobile': mobile, 'verify_for': 'reset_password'},
    );
  }

  static Future<void> verifyOtpForResetPassword(
    String mobile,
    String otp,
  ) async {
    final token = await ApiService.sendPmsRequest<String>(
      ApiService.verifyResetPasswordOtpEndpoint,
      method: 'POST',
      body: {'mobile': mobile, 'otp': otp},
      useAuthToken: false,
    );

    if (token.isNotEmpty) {
      Get.toNamed(AppRoutes.resetpassword, arguments: {'token': token});
    }
  }

  static Future<void> resetPassword(String token, String newPassword) async {
    final msg = await ApiService.sendPmsRequest<String>(
      ApiService.resetPasswordEndpoint,
      method: 'POST',
      body: {'token': token, 'newPassword': newPassword},
      useAuthToken: false,
    );
    if (Get.context != null) {
      CustomSnackbar.show(msg, Get.context!, type: SnackbarType.success);
    }
    Get.offAllNamed(AppRoutes.login);
  }
}
