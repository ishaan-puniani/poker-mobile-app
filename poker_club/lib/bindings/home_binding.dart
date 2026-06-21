import 'package:get/get.dart';
import 'package:poker_club/viewmodel/auth_controller.dart';
import 'package:poker_club/viewmodel/home_controller.dart';
import 'package:poker_club/viewmodel/splash_controller.dart';
import 'package:poker_club/viewmodel/wallet_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(WalletController());
    Get.put(HomeController());
    Get.put(SplashController());
  }
}
