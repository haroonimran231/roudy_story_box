import 'package:flutter/material.dart';
import 'package:roudy_story_box/constraints.dart';
import 'package:roudy_story_box/routes/onboarding1.dart';

class SplashPage extends StatelessWidget {
  static var routeName;

  // static var routeName;

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => onBoarding1(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: powderPink,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Splash.png",
              // height: 180.0,
              // width: 180,
            ),
           
          ],
        ),
      ),
    );
  }
}
