import 'package:flutter/material.dart';

import '../constraints.dart';

class onBoarding1 extends StatelessWidget {
  const onBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: powderPink,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/onboarding1.png",
              // height: 180.0,
              // width: 420,
            ),
          ),
          MaterialButton(
            height: 100, minWidth: 390, child: new Text("Next"),
            onPressed: () {}, splashColor: Colors.amber,
            // child: Text(
            //   "Next",
            // ),
          )
        ],
      ),
    );
  }
}
