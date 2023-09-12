import 'index.dart';

class Welcome1Controller extends GetxController {
  move() async {
    Get.toNamed(AppRoutes.welcome);
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
}
