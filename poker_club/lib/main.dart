import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poker_club/bindings/home_binding.dart';
import 'package:poker_club/resources/strings.dart';
import 'package:poker_club/resources/theme/app_theme.dart';
import 'package:poker_club/resources/translations.dart';
import 'package:poker_club/route/app_pages.dart';
import 'package:poker_club/route/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(874, 403),
      child: GetMaterialApp(
        initialBinding: HomeBinding(),
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
      ),
    );
  }
}
