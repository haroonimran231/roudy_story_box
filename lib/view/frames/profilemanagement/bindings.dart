import 'index.dart';

class ProfileManageBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileManagementController());
  }
}
