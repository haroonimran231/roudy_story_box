import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roudy_story_box/common/color/color.dart';
import 'package:roudy_story_box/view/frames/welcome_page.dart';

class onBoarding2Page extends StatelessWidget {
  const onBoarding2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: powderPink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                "assets/images/onboarding2.png",
                height: 660,
                width: 395,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FilledButton(
                onPressed: () {
                  Get.to(WelcomePage());
                },
                child: Text(
                  "Discover Now",
                  style: TextStyle(fontSize: 20.5, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size(300, 71)),
                )),
          ],
        ),
      ),
    );
  }
}
