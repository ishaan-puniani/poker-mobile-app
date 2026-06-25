import 'package:get/get.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/middleware/auth_middleware.dart';
import 'package:poker_club/view/auth/forgot_password_screen.dart';
import 'package:poker_club/view/auth/log_in_screen.dart';
import 'package:poker_club/view/auth/otp_verification_screen.dart';
import 'package:poker_club/view/auth/reset_password_screen.dart';
import 'package:poker_club/view/auth/sign_up_screen.dart';
import 'package:poker_club/view/home/homescreen.dart';
import 'package:poker_club/view/home/leaderboard_screen.dart';
import 'package:poker_club/view/mission/mission_screen.dart';
import 'package:poker_club/view/table/play_screen.dart';
import 'package:poker_club/view/table/table_screen.dart';
import 'package:poker_club/view/splash/splash_screen.dart';

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
      middlewares: [AuthMiddleware()],
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
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.leaderboardScreen,
      page: () => LeaderboardScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.missionScreen,
      page: () => MissionScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.playScreen,
      page: () => PlayScreen(),
      transitionDuration: const Duration(milliseconds: 200),
      transition: Transition.rightToLeftWithFade,
      middlewares: [AuthMiddleware()],
    ),
  ];
}
