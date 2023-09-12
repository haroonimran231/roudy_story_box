import 'index.dart';

class Onboarding2Controller extends GetxController {
  move() {
    Get.toNamed(AppRoutes.onboarding2);
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
}
