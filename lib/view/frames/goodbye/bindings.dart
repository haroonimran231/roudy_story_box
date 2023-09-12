import 'index.dart';

class EndingBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(EndingScreenController());
  }
}
