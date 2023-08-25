import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/route_manager.dart';
import 'package:roudy_story_box/common/color/color.dart';
import 'package:roudy_story_box/view/frames/onboarding2_page.dart';
// import 'package:get/get.dart';

class onBoarding1Page extends StatelessWidget {
  const onBoarding1Page({super.key});

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
                "assets/images/onboarding1.png",
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
                  Get.to(onBoarding2Page());
                },
                child: Text(
                  "Next",
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
