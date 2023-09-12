import 'index.dart';

class HomeController extends GetxController {
  move() async {
    Get.toNamed(AppRoutes.home);
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
}
