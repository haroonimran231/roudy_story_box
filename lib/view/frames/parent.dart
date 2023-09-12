import 'package:get/get.dart';
import 'package:roudy_story_box/run_app/index.dart';

class ParentalControlController extends GetxController {
  RxInt timeLimit = 0.obs; // Initialize time limit to 0.
  RxInt storiesLimit = 0.obs; // Initialize stories limit to 0.

  void setTimeLimit(int limit) {
    timeLimit.value = limit;
  }

  void setStoriesLimit(int limit) {
    storiesLimit.value = limit;
  }
}

class ParentalControlScreen extends StatelessWidget {
  final ParentalControlController controller =
      Get.put(ParentalControlController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parental Control')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Time Limit (in minutes)'),
              onChanged: (value) {
                controller.setTimeLimit(int.tryParse(value) ?? 0);
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Stories Limit'),
              onChanged: (value) {
                controller.setStoriesLimit(int.tryParse(value) ?? 0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
