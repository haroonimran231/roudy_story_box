import 'index.dart';

class HomeboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
