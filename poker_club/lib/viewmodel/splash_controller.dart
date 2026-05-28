import 'dart:async';
import 'package:get/get.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';

class SplashController extends GetxController {
  int progress = 0; // 👈 now 0 to 100
  Timer? timer;

  bool showAuthoptionals = false;

  void showAuthOptions() {
    showAuthoptionals = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    hitApi();
  }

  Future<void> hitApi() async {
    timer = Timer.periodic(const Duration(milliseconds: 20), (t) {
      if (progress < 90) {
        progress += 2; // speed control
        update();
      }
    });

    await Future.delayed(
      const Duration(milliseconds: 2500),
    ); // Simulate API call delay

    timer?.cancel();

    progress = 100; // 👈 final
    update();

    if (Get.isRegistered<AuthController>()) {
      final authController = Get.find<AuthController>();
      if (authController.isAuthenticated.value) {
        Get.offAllNamed('/home');
        return;
      }
    }
    showAuthOptions();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
