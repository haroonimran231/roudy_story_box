import 'package:get/get.dart';
import 'package:roudy_story_box/common/color/color.dart';
import 'package:flutter/material.dart';
import 'package:roudy_story_box/view/frames/login_page.dart';
import 'package:roudy_story_box/view/frames/profile_create_page.dart';

class SignupPage extends StatelessWidget {
  // static var routeName;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // static var routeName;

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.paleGold,
        body: Center(
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
                        "Sign Up",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextFormField(
                        controller: _nameController,
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
                          labelText: 'Enter Name',
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _emailController,
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
                          labelText: 'Enter Email',
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _passwordController,
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
                            labelText: 'Password'),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
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
                            labelText: 'Confirm Password'),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FilledButton(
                        onPressed: () {
                          Get.to(ProfileCreation());
                        },
                        child: Text(
                          "Create Account",
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
                                "                      do you have an already account?",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.off(LoginPage());
                              },
                              child: Text("Login"))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
