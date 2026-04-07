import 'package:get/get.dart';
import 'package:poker_club/viewmodel/splashController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
