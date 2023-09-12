import 'index.dart';

class ProfileController extends GetxController {
  move() {
    Get.toNamed(AppRoutes.profilecreation);
    // Get.put(GenderController(), permanent: true);
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
}
