import 'package:firebase_core/firebase_core.dart';
import 'package:roudy_story_box/run_app/index.dart';
import 'package:roudy_story_box/view/frames/auth/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MyApp());
}
