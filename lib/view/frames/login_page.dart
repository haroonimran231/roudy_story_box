import 'package:get/get.dart';
import 'package:roudy_story_box/common/color/color.dart';
import 'package:flutter/material.dart';
import 'package:roudy_story_box/view/frames/signup_page.dart';

class LoginPage extends StatelessWidget {
  // static var routeName;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // static var routeName;

  LoginPage({super.key});

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
                        "Login",
                        style: TextStyle(fontSize: 20),
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
                        height: 7,
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
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {},
                            child: SizedBox(
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
                        onPressed: () {},
                        child: Text(
                          "Log In",
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
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "                                    don't have an account?",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(SignupPage());
                              },
                              child: Text("Signup"))
                        ],
                      ),
                      Text(
                        "----OR----",
                        style: TextStyle(fontSize: 20),
                      ),

                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Sign Up with")),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.apple,
                                size: 48,
                              )),
                          InkWell(
                              child: Image.asset("assets/images/Google.png")),
                          // IconButton(onPressed: () {}, icon: Icon(Icons.apple)),
                        ],
                      ),

                      // FilledButton.icon(
                      //   onPressed: () {
                      //     // Add your button's onPressed logic here
                      //   },
                      //   label: Text(
                      //     'Get Started',
                      //     style: TextStyle(color: purple),
                      //   ),
                      //   icon: Icon(
                      //     Icons.arrow_forward,
                      //     color: purple,
                      //   ),
                      //   style: ButtonStyle(
                      //     minimumSize: MaterialStateProperty.resolveWith(
                      //       (states) => Size(310, 44),
                      //     ),
                      //     backgroundColor: MaterialStateProperty.all<Color>(
                      //         softblue), // Set the desired background color
                      //   ),
                      // ),
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
