import 'dart:async';
import 'package:get/get.dart';
import 'package:poker_club/services/game_service.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';
import 'package:poker_club/viewmodel/home_controller.dart';
import 'package:poker_club/viewmodel/mission_controller.dart';

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
    // Animate the progress bar up to 90% while the real work happens.
    timer = Timer.periodic(const Duration(milliseconds: 20), (t) {
      if (progress < 90) {
        progress += 2; // speed control
        update();
      }
    });

    // Fetch game cards
    final gameCards = await GameService.fetchGameCards();

    // Wait for the persisted session and user profile to actually load.
    final authController = Get.put<AuthController>(AuthController());
    await authController.ready;

    // Set game cards in HomeController
    final homeController = Get.put<HomeController>(HomeController());
    homeController.setGames(gameCards);

    // Set missions in MissionController
    final missionController = Get.put<MissionController>(MissionController());
    await missionController.fetchMissions();
    final userId = authController.user.value?.id;
    if (userId != null) {
      await missionController.fetchMissionsProgress(userId);
    }

    timer?.cancel();

    progress = 100; // 👈 final
    update();

    if (Get.isRegistered<AuthController>()) {
      final authController = Get.find<AuthController>();
      if (authController.isAuthenticated) {
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
