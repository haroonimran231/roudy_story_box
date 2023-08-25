import 'package:roudy_story_box/common/color/color.dart';
import 'package:roudy_story_box/view/frames/onboarding1_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  // static var routeName;

  // static var routeName;

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: powderPink,
      body: Center(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/images/welcome.png",
                height: 439,
                width: 390,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                height: 439,
                width: 390,
                // color: Colors.transparent,
                decoration: const BoxDecoration(
                  color: linearpowderpink,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // height: 99,
                      child: Text(
                        "Welcome!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 62,
                    ),
                    FilledButton.icon(
                      onPressed: () {
                        // Add your button's onPressed logic here
                      },
                      label: Text(
                        'Get Started',
                        style: TextStyle(color: purple),
                      ),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: purple,
                      ),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                          (states) => Size(310, 44),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            softblue), // Set the desired background color
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      // Expanded(
      //       child: Container(
      //         // color: Colors.transparent,
      //         width: MediaQuery.of(context).size.width,
      //         decoration: const BoxDecoration(
      //           color: KTextWhiteColor,
      //           borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(KDefaultPadding * 3),
      //             topRight: Radius.circular(KDefaultPadding * 3),
      //           ),
      //         ),),)
    );
  }
}
