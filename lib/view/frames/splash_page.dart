import 'package:roudy_story_box/view/frames/onboarding1_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  // static var routeName;

  // static var routeName;

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => onBoarding1Page(),
        ),
      );
    });
    return Scaffold(
      // backgroundColor: powderPink,
      body: Container(
        child: Image.asset(
          "assets/images/Splash.png",
          height: 800,
          width: 390,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
