import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:roudy_story_box/run_app/index.dart';

class ImageController extends GetxController {
  var imageUrl = ''.obs; // Observed variable to store the image URL
  var isLoading = false.obs; // Observed variable to track loading state

  // Function to fetch an image from a URL
  Future<void> fetchImage() async {
    try {
      isLoading.value = true;
      final response = await Dio().get(
          'https://pub-3626123a908346a7a8be8d9295f44e26.r2.dev/generations/0-5531d74e-fbcd-4e82-b453-bea976799547.png');
      if (response.statusCode == 200) {
        imageUrl.value = response.data.toString();
      } else {
        imageUrl.value =
            'https://pub-3626123a908346a7a8be8d9295f44e26.r2.dev/generations/0-5531d74e-fbcd-4e82-b453-bea976799547.png'; // Set an empty URL if there was an error
      }
    } catch (e) {
      imageUrl.value =
          'https://pub-3626123a908346a7a8be8d9295f44e26.r2.dev/generations/0-5531d74e-fbcd-4e82-b453-bea976799547.png'; // Set an empty URL if there was an error
    } finally {
      isLoading.value = false;
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Fetcher'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<ImageController>(
                init: ImageController(), // Initialize the controller
                builder: (controller) {
                  return controller.isLoading.value
                      ? CircularProgressIndicator()
                      : controller.imageUrl.value.isNotEmpty
                          ? Image.network(controller.imageUrl.value)
                          : Text('Image not found');
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Fetch the image when the button is pressed
                  Get.find<ImageController>().fetchImage();
                },
                child: Text('Fetch Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
