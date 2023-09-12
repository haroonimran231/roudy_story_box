import 'index.dart';

class ChatboardController extends GetxController {
  move() {
    Get.toNamed(AppRoutes.chatboard);
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
}
