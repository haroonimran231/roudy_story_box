import 'package:get/get.dart';
import 'package:roudy_story_box/view/frames/onboarding1_page.dart';
import 'package:flutter/material.dart';
import 'package:roudy_story_box/view/frames/welcome_page.dart';

class SplashPage extends StatelessWidget {
  // static var routeName;

  // static var routeName;

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(WelcomePage());
    });
    return Scaffold(
      // backgroundColor: powderPink,
      body: Container(
        child: Image.asset(
          "assets/images/Splash.png",
          height: 850,
          width: 390,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
