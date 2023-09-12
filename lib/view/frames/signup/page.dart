import 'index.dart';

class SignupPage extends StatelessWidget {
  // static var routeName;

  // static var routeName;

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
                Container(
                  child: Image.asset(
                    "assets/images/login.png",
                    height: 350,
                    width: 390,
                    fit: BoxFit.cover,
                  ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up".tr,
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          controller: controller.nameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(),
                            prefixIcon: Icon(
                              Icons.man_rounded,
                              color: Colors.black,
                            ),
                            fillColor: AppColors.mintGreen,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: 'Enter Name'.tr,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            fillColor: AppColors.mintGreen,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: 'Enter Email'.tr,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              fillColor: AppColors.mintGreen,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              labelText: 'Password'.tr),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: controller.confirmPasswordController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              fillColor: AppColors.mintGreen,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              labelText: 'Confirm Password'.tr),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FilledButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.profilecreation);
                          },
                          child: Text(
                            "Create Account".tr,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.resolveWith(
                              (states) => Size(175, 35),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors
                                    .mintGreen), // Set the desired background color
                          ),
                        ),
                        SizedBox(
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
                                  style: TextStyle(
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
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
