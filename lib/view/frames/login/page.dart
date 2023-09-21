import 'index.dart';

class LoginPage extends StatelessWidget {
  // ... (other code)

  // ignore: use_key_in_widget_constructors
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.paleGold,
        body: GetBuilder<LoginController>(
          builder: (controller) {
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
                      decoration: const BoxDecoration(
                        color: AppColors.paleGold,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Login'.tr,
                            style: const TextStyle(fontSize: 20),
                          ),
                          TextFormField(
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
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              labelText: 'Enter Email'.tr,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          TextFormField(
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
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              labelText: 'Password'.tr,
                            ),
                            obscureText: true,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: () {},
                                child: SizedBox(
                                  height: 15,
                                  child: Text(
                                    'Forgot Password?'.tr,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FilledButton(
                            onPressed: () {
                              if (controller.emailController.text.isEmpty ||
                                  controller.passwordController.text.isEmpty) {
                                // Show an error message when fields are empty
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Please enter username and password"
                                            .tr),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                Get.toNamed(AppRoutes.profilecreation);
                              }
                            },
                            child: Text(
                              "Log In".tr,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.resolveWith(
                                (states) => const Size(175, 35),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.mintGreen,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "don't have an account?".tr,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(AppRoutes.signup);
                                },
                                child: Text("Signup".tr),
                              ),
                            ],
                          ),
                          Text(
                            "----OR----".tr,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Sign Up with".tr),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.apple,
                                  size: 48,
                                ),
                              ),
                              InkWell(
                                child: Image.asset("assets/images/Google.png"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
