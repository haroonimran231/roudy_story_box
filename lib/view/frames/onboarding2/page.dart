import 'index.dart';

class onBoarding2Page extends StatelessWidget {
  const onBoarding2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.powderPink,
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
                Get.toNamed(AppRoutes.welcome);
              },
              child: Text(
                "Discover Now".tr,
                style: TextStyle(fontSize: 20.5, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.resolveWith(
                    (states) => Size(190, 50)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
