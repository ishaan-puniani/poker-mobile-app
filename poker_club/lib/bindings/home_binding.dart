import 'package:get/get.dart';
import 'package:poker_club/viewmodel/homecontroller.dart';
import 'package:poker_club/viewmodel/splashController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Homecontroller());
    Get.put(SplashController());
  }
}
