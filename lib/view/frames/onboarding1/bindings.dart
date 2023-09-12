import 'index.dart';

class Onboarding1Bindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Onboarding1Controller());
  }
}
