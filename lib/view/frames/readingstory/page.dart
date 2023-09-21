import 'index.dart';

class ReadingStory extends StatelessWidget {
  const ReadingStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamyYellow,
      appBar: AppBar(
        backgroundColor: AppColors.creamyYellow,
        title: Text("Read Story".tr),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 650,
              child: Image.asset(
                "assets/images/read.png",
                // width: 500,
                // height: 300,
              ),
            ),
            Expanded(
              child: Container(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
