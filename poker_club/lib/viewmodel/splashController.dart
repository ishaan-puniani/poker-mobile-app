import 'dart:async';
import 'package:get/get.dart';

class SplashController extends GetxController {
  int progress = 0; // 👈 now 0 to 100
  Timer? timer;

  bool showAuthoptionals = false;

  void showauthoption() {
    showAuthoptionals = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    hitApi();
  }

  Future<void> hitApi() async {
    timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      if (progress < 90) {
        progress += 2; // speed control
        update();
      }
    });

    await Future.delayed(const Duration(seconds: 5));

    timer?.cancel();

    progress = 100; // 👈 final
    update();

    await Future.delayed(const Duration(milliseconds: 300));

    // Get.offAllNamed("/home");
    showauthoption();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
