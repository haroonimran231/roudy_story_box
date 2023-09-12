import 'index.dart';

class ProfileManagementController extends GetxController {
  move() async {
    Get.toNamed(AppRoutes.home);
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
}
