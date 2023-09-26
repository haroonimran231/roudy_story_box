import 'package:roudy_story_box/common/routes/index.dart';

import 'index.dart';

class SplashPage extends StatelessWidget {
  // static var routeName;

  // static var routeName;

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: powderPink,

      body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (context) {
            return Container(
              child: Image.asset(
                "assets/images/Splash.png",
                height: 850,
                width: 390,
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
}
