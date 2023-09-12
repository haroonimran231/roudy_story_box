import 'index.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(GenderController(), permanent: true);
  }
}
