import 'package:get/get.dart';

class GenderController extends GetxController {
  var selectedGender = 'Male'.obs; // Default value

  void changeGender(String gender) {
    selectedGender.value = gender;
  }
}
