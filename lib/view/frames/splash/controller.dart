import 'dart:async';

import 'index.dart';

class SplashController extends GetxController {
  move() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(AppRoutes.onboarding1);
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
}
