import 'package:roudy_story_box/common/routes/routes.dart';

import 'index.dart';
// import 'package:get/get.dart';

class onBoarding1Page extends StatelessWidget {
  final List locale = [
    {"name": "English", "locale": Locale("en", "US")},
    {"name": "اردو", "locale": Locale("ur", "PK")},
    {"name": "हिंदी", "locale": Locale("hi", "IN")},
  ];

  onBoarding1Page({super.key});

  updatelanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
              title: Text("Choose a language"),
              content: Container(
                  width: double.maxFinite,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                print(locale[index]["name"]);
                                updatelanguage(locale[index]["locale"]);
                              },
                              child: Text(locale[index]["name"])),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.amber,
                        );
                      },
                      itemCount: locale.length)));
        });
  }

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
                  Get.toNamed(AppRoutes.onboarding2);
                },
                child: Text(
                  "Next".tr,
                  style: TextStyle(fontSize: 20.5, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith(
                      (states) => Size(300, 71)),
                )),
            ElevatedButton(
                onPressed: () {
                  builddialog(context);
                },
                child: Text("change Language".tr))
          ],
        ),
      ),
    );
  }
}
