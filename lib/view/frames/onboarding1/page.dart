import 'package:roudy_story_box/common/routes/routes.dart';

import 'index.dart';
// import 'package:get/get.dart';

class OnBoarding1Page extends StatelessWidget {
  final List locale = [
    {
      "name": "English(English)                       🇺🇸",
      "locale": const Locale("en", "US")
    },
    {
      "name": "Urdu(اردو)                                  🇵🇰",
      "locale": const Locale("ur", "PK")
    },
    {
      "name": "Hindi(हिंदी)                                 🇮🇳",
      "locale": const Locale("hi", "IN")
    },
    {
      "name": "Chinese(中文)                           🇨🇳",
      "locale": const Locale("zh", "CN")
    },
    {
      "name": "French(français)                       🇫🇷",
      "locale": const Locale("fr", "CH")
    },
    {
      "name": "German(Deutsch)                     🇩🇪",
      "locale": const Locale("de", "CH")
    },
  ];

  OnBoarding1Page({super.key});

  updatelanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
              title: const Text("Choose a language"),
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
                        return const Divider(
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
            const SizedBox(
              height: 20,
            ),
            FilledButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.onboarding2);
                },
                child: Text(
                  "Next".tr,
                  style: const TextStyle(
                      fontSize: 20.5, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith(
                      (states) => const Size(180, 45)),
                )),
            FilledButton(
                style: ButtonStyle(
                  // backgroundColor: MaterialStateColor.resolveWith(
                  //     (states) => AppColors.softblue),
                  minimumSize: MaterialStateProperty.resolveWith(
                      (states) => const Size(180, 45)),
                ),
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
