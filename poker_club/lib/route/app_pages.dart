import 'package:get/get.dart';
import 'package:poker_club/bindings/home_binding.dart';
import 'package:poker_club/bindings/splash_binding.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/view/home_screen/homescreen.dart';
import 'package:poker_club/view/splash_screen/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(), // ✅ attach controller
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => Homescreen(),
      binding: HomeBinding(), // ✅ attach controller
    ),
  ];
}
