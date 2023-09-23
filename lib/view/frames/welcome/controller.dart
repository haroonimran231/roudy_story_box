import 'package:roudy_story_box/view/frames/welcome/welome_screen.dart';

import 'index.dart';

class Welcome1Controller extends GetxController {
  move() async {
    // Get.toNamed(AppRoutes.welcome);
    WelcomeServices welcomScreen = WelcomeServices();
  }

  @override
  void onInit() {
    move();
    super.onInit();
  }
}
