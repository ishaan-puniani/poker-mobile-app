import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:poker_club/resources/strings.dart';
import 'package:poker_club/resources/theme/app_theme.dart';
import 'package:poker_club/resources/translations.dart';
import 'package:poker_club/route/app_pages.dart';
import 'package:poker_club/route/app_route.dart';
import 'package:poker_club/view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appname.tr,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      translations: AppTranslations(),
      locale: Locale('en', 'US'), // default language
      fallbackLocale: Locale('en', 'US'),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
