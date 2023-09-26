import 'index.dart';

class ReadingStory extends StatelessWidget {
  const ReadingStory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.creamyYellow,
        appBar: AppBar(
          backgroundColor: AppColors.softblue,
          title: Text("Read Story".tr),
        ),
        body: Column(
          children: [
            SizedBox(
              width: 400,
              height: 650,
              child: Image.asset(
                "assets/images/read.png",
                // width: 500,
                // height: 300,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  FilledButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.storydisplaypage);
                    },
                    child: Text("Try Free Trial 7 Days".tr),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
