import 'package:roudy_story_box/view/frames/welcome/welome_screen.dart';

import 'index.dart';

class WelcomePage extends StatelessWidget {
  // static var routeName;
  // static var routeName;

  WelcomePage({super.key});

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
                  color: AppColors.linearpowderpink,
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
                        "              Welcome! \n Lets hear a story from you"
                            .tr,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 62,
                    ),
                    FilledButton.icon(
                      onPressed: () {
                        Get.toNamed(AppRoutes.login);

                        // Add your button's onPressed logic here
                      },
                      label: Text(
                        'Get Started'.tr,
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.resolveWith(
                          (states) => Size(180, 45),
                        ),
                        // backgroundColor: MaterialStateProperty.all<Color>(
                        //     AppColors
                        //         .softblue), // Set the desired background color
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
