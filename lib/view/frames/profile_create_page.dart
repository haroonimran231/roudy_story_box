import 'package:flutter/material.dart';

class ProfileCreation extends StatelessWidget {
  const ProfileCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD9D9D9),
      // body: SizedBox(height: 67, child: Text("Profile Creation")),
      body: Container(
        margin: EdgeInsets.only(top: 174.0), // Adjust the margin value
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile Creation',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
