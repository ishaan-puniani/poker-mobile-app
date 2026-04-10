import 'package:get/get.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/view/auth_screens/forgot_password_screen.dart';
import 'package:poker_club/view/auth_screens/log_in_screen.dart';
import 'package:poker_club/view/auth_screens/sign_up_screen.dart';
import 'package:poker_club/view/home_screen/homescreen.dart';
import 'package:poker_club/view/splash_screen/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => Homescreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignUpScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LogInScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.forgotpassword,
      page: () => ForgotPasswordScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
