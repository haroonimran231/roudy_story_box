import 'index.dart';

class SignupPage extends StatelessWidget {
  // static var routeName;
  // bool loading = false;
  // static var routeName;
  // FirebaseAuth _auth = FirebaseAuth.instance;
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.paleGold,
        body: GetBuilder<SignupController>(builder: (controller) {
          return Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login.png",
                  height: 350,
                  width: 390,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    height: 300,
                    width: 390,
                    // color: Colors.transparent,
                    decoration: const BoxDecoration(
                      color: AppColors.paleGold,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Sign Up'.tr,
                            style: const TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            controller: controller.nameController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(),
                              prefixIcon: const Icon(
                                Icons.man_rounded,
                                color: Colors.black,
                              ),
                              fillColor: AppColors.mintGreen,
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              labelText: 'Enter Name'.tr,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(),
                              prefixIcon: const Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              fillColor: AppColors.mintGreen,
                              filled: true,
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              labelText: 'Enter Email'.tr,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: controller.passwordController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                fillColor: AppColors.mintGreen,
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                labelText: 'Password'.tr),
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            controller: controller.confirmPasswordController,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                fillColor: AppColors.mintGreen,
                                filled: true,
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                labelText: 'Confirm Password'.tr),
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          FilledButton(
                            onPressed: () async {
                              AuthController.instance.register(
                                  controller.emailController.text.trim(),
                                  controller.passwordController.text.trim());
                              CollectionReference ref =
                                  FirebaseFirestore.instance.collection('user');

                              String docId = ref.doc().id;

                              await ref.doc(docId).set({
                                'name': controller.nameController.text,
                                'id': docId,
                                'email': controller.emailController.text,
                                'password': controller.passwordController.text
                              });

                              // if (controller.emailController.text.isEmpty ||
                              //     controller.passwordController.text.isEmpty) {
                              //   // Show an error message when fields are empty
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     SnackBar(
                              //       content: Text(
                              //           "Please enter username and password".tr),
                              //       duration: const Duration(seconds: 2),
                              //     ),
                              //   );
                              // } else {
                              //   Get.toNamed(AppRoutes.login);
                              // }

                              // _auth
                              //     .createUserWithEmailAndPassword(
                              //       email: controller.emailController.text
                              //           .toString(),
                              //       password: controller.passwordController.text
                              //           .toString(),
                              //     )
                              //     .then(
                              //       (value) {},
                              //     )
                              //     .onError((error, stackTrace) {
                              //   Utills().toastMessage(error.toString());
                              // });
                            },
                            child: Text(
                              "Create Account".tr,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.resolveWith(
                                (states) => const Size(135, 35),
                              ),
                              // backgroundColor: MaterialStateProperty.all<Color>(
                              //     AppColors
                              //         .mintGreen), // Set the desired background color
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "                      do you have an already account?"
                                        .tr,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.toNamed(AppRoutes.login);
                                  },
                                  child: Text("Login".tr))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
