import 'package:get/get.dart';
import 'package:poker_club/viewmodel/splashcontroller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
