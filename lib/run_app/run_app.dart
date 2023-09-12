import 'package:roudy_story_box/view/frames/picture/picture.dart';

import 'index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: const Locale('en', 'US'),
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),

      home: StoryDisplayPage(),
      // initialBinding: BindingsBuilder(() {
      //   Get.put(GenderController(), permanent: true);
      // }),
    );
  }
}
