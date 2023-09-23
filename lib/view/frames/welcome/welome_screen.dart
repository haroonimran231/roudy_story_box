import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:roudy_story_box/run_app/index.dart';

class WelcomeServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    if (user != null) {
      Timer(Duration(seconds: 3), () => Get.toNamed(AppRoutes.home));
    } else {
      Timer(Duration(seconds: 3), () => Get.toNamed(AppRoutes.login));
    }
  }
}
