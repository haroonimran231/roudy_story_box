// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class ProfileController extends GetxController {
//   RxString name = ''.obs;
//   RxString gender = ''.obs;
//   RxString email = ''.obs;
//   RxString password = ''.obs;

//   void updateProfile(String newName, String newGender, String newEmail, String newPassword) {
//     name.value = newName;
//     gender.value = newGender;
//     email.value = newEmail;
//     password.value = newPassword;
//   }
// }

import 'package:roudy_story_box/view/frames/goodbye/page.dart';

import 'index.dart';

class EndingScreenController extends GetxController
    with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();
    // Register this controller as an observer for app lifecycle events.
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    // Unregister this controller as an observer when it is closed.
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // The app is being terminated (closed). Navigate to the ending screen.
      Get.offAll(
          EndingScreen()); // Replace with the actual ending screen route.
    }
  }
}
