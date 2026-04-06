import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:poker_club/resources/color_pallete.dart';
import 'package:poker_club/resources/strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorPallete.primarybgcolor, // 👈 your gradient
        ),
        child: SafeArea(
          child: Center(
            child: Text(
              AppStrings.appname.tr,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
