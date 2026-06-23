import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (Get.isRegistered<AuthController>()) {
      final authController = Get.find<AuthController>();
      if (authController.isAuthenticated) {
        return null;
      }
    }

    return const RouteSettings(name: AppRoutes.splash);
  }
}
