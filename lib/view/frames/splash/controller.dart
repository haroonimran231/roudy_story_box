import 'index.dart';

class SplashController extends GetxController {
  move() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(AppRoutes.splash);
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
  // move() {
  //   Get.toNamed(AppRoutes.splash);
  // }

  // @override
  // void onInit() {
  //   move();
  //   super.onInit();
  // }
}
