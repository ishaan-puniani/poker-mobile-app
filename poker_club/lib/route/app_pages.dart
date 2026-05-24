import 'package:get/get.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/view/auth_screens/forgot_password_screen.dart';
import 'package:poker_club/view/auth_screens/log_in_screen.dart';
import 'package:poker_club/view/auth_screens/otp_verification_screen.dart';
import 'package:poker_club/view/auth_screens/reset_password_screen.dart';
import 'package:poker_club/view/auth_screens/sign_up_screen.dart';
import 'package:poker_club/view/home_screen/homescreen.dart';
import 'package:poker_club/view/home_screen/leaderboard_screen.dart';
import 'package:poker_club/view/home_screen/mission_screen.dart';
import 'package:poker_club/view/home_screen/table_screen.dart';
import 'package:poker_club/view/splash_screen/splash_screen.dart';
import 'package:poker_club/view/game_screen/game_screen.dart';

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
      name: AppRoutes.loginOtp,
      page: () => LogInScreen(isOtpLogin: true),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.forgotpassword,
      page: () => ForgotPasswordScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.otpVerificationScreen,
      page: () => OtpVerificationScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.resetpassword,
      page: () => ResetPasswordScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.tableScreen,
      page: () => TableScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.gameScreen,
      page: () => GameScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.leaderboardScreen,
      page: () => LeaderboardScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.missionScreen,
      page: () => MissionScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
