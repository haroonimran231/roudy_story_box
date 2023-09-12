import 'index.dart';

class Onboarding2Bindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Onboarding2Controller());
  }
}
