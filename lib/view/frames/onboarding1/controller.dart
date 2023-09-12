import 'index.dart';

class Onboarding1Controller extends GetxController {
  move() {
    Get.toNamed(AppRoutes.onboarding1);
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
}
