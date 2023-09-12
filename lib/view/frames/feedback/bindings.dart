import 'index.dart';

class FeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FeedbackController());
  }
}
