import 'package:firebase_auth/firebase_auth.dart';

import 'index.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  // move() {
  //   Get.toNamed(AppRoutes.login);
  // }

  // @override
  // void onInit() {
  //   move();
  //   super.onInit();
  // }
}
