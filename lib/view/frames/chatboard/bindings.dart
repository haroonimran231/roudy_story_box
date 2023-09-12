import 'index.dart';

class ChatboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ChatboardController());
  }
}
