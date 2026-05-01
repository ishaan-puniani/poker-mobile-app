import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // navigate after delay
    Future.delayed(const Duration(seconds: 3), () {
      // navigation logic here
    });
  }
}
