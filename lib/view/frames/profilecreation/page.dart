import 'index.dart';

class ProfileCreation extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  // final ImagePickerController _controller = Get.put(ImagePickerController());

  ProfileCreation({super.key});

  @override
  Widget build(BuildContext context) {
    final GenderController _genderController =
        Get.put(GenderController(), permanent: true);

    // Get.find();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.linearpowderpink,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50), // Adjust as needed
                  Text(
                    "Profile Creation",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20), // Adjust as needed
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/profile.png",
                    ),
                  ),
                  Text("Profile Picture")
                ],
              ),
            ),
            Container(
              height: 420,
              width: double.infinity,
              color: Colors.grey[800],
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: 'Enter Name'.tr,
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  TextFormField(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Select Gender'.tr,
                        content: DropdownButtonFormField<String>(
                          value: _genderController.selectedGender.value,
                          items: ['Male'.tr, 'Female'.tr].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _genderController.changeGender(value!);
                          },
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Gender'.tr,
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20), // Adjust as needed
                  FilledButton.icon(
                    onPressed: () {
                      Get.toNamed(AppRoutes.home);
                    },
                    label: Text(
                      'Next'.tr,
                      style: TextStyle(color: AppColors.purple),
                    ),
                    icon: Icon(
                      Icons.arrow_forward,
                      color: AppColors.purple,
                    ),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith(
                        (states) => Size(310, 44),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.softblue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
