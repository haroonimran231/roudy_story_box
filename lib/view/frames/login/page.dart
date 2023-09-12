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
                          const Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              fillColor: AppColors.mintGreen,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              labelText: 'Enter Email',
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          TextFormField(
                            controller: controller.passwordController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              fillColor: AppColors.mintGreen,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              labelText: 'Password',
                            ),
                            obscureText: true,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: () {},
                                child: const SizedBox(
                                  height: 15,
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
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
                                        "Please enter username and password"),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                Get.toNamed(AppRoutes.profilecreation);
                              }
                            },
                            child: const Text(
                              "Log In",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
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
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "don't have an account?",
                                    style: TextStyle(
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
                                child: const Text("Signup"),
                              ),
                            ],
                          ),
                          const Text(
                            "----OR----",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Sign Up with"),
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
