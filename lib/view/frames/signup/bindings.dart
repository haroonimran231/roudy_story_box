import 'index.dart';

class SignupBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}
