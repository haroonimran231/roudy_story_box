import 'index.dart';

class WelcomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Welcome1Controller());
  }
}
