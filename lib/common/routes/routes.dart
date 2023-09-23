import 'package:roudy_story_box/view/frames/feedback/bindings.dart';
import 'package:roudy_story_box/view/frames/feedback/page.dart';
import 'package:roudy_story_box/view/frames/goodbye/page.dart';
import 'package:roudy_story_box/view/frames/storydisplay/story_display.dart';
import 'package:roudy_story_box/view/frames/readingstory/page.dart';

import 'index.dart';

class AppRoutes {
  static const String splash = RouteNames.splash;
  static const String onboarding1 = RouteNames.onboarding1;
  static const String onboarding2 = RouteNames.onboarding2;
  static const String home = RouteNames.home;
  static const String login = RouteNames.login;
  static const String signup = RouteNames.signup;
  static const String welcome = RouteNames.welcome;
  static const String profilemanagement = RouteNames.profilemanagement;
  static const String profilecreation = RouteNames.profilecreation;
  static const String feedback = RouteNames.feedback;
  static const String chatboard = RouteNames.chatboard;
  static const String readingstory = RouteNames.readingstory;
  static const String goodbye = RouteNames.goodbye;
  static const String storydisplaypage = RouteNames.storydisplaypage;

  static List<GetPage> pages = [
    GetPage(
        name: splash,
        page: () => const SplashPage(),
        binding: SplashBindings()),
    GetPage(
        name: onboarding1,
        page: () => OnBoarding1Page(),
        binding: Onboarding1Bindings()),
    GetPage(
        name: onboarding2,
        page: () => const onBoarding2Page(),
        binding: Onboarding2Bindings()),
    GetPage(
        name: welcome, page: () => WelcomePage(), binding: WelcomeBindings()),
    GetPage(
        name: profilecreation,
        page: () => ProfileCreation(),
        binding: ProfileBindings()),
    GetPage(name: login, page: () => LoginPage(), binding: LoginBindings()),
    GetPage(
      name: signup,
      page: () => SignupPage(),
      binding: SignupBindings(),
    ),
    GetPage(name: home, page: () => HomePage(), binding: HomeboardBindings()),
    GetPage(
      name: chatboard,
      page: () => Chatboard(),
      binding: ChatboardBindings(),
    ),
    GetPage(
      name: profilemanagement,
      page: () => ProfileManagement(),
      binding: ProfileManageBindings(),
    ),
    GetPage(
      name: feedback,
      page: () => FeedbackPage(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: readingstory,
      page: () => ReadingStory(),
      // binding: FeedbackBinding(),
    ),
    GetPage(
      name: storydisplaypage,
      page: () => StoryDisplayPage(),
      // binding: FeedbackBinding(),
    ),
    GetPage(
      name: goodbye,
      page: () => EndingScreen(),
      binding: FeedbackBinding(),
    ),
  ];
}
