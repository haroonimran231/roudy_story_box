// import 'index.dart';

// class SplashController extends GetxController {
//   move() async {
//     await Future.delayed(const Duration(seconds: 3));
//     Get.to(AppRoutes.onboarding1);
//   }

//   @override
//   void onInit() {
//     move();
//     super.onInit();
//   }
//   // move() {
//   //   Get.toNamed(AppRoutes.onboarding1);
//   // }

//   // @override
//   // void onInit() {
//   //   move();
//   //   super.onInit();
//   // }
// }
import 'index.dart';

class SplashController extends GetxController {
  move() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      Get.toNamed(AppRoutes.onboarding1);
    } catch (e) {
      // Handle any navigation errors here.
      print('Navigation error: $e');
    }
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
}
