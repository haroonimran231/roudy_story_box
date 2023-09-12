import 'index.dart';

class FeedbackController extends GetxController {
  var feedbackList = <CartoonFeedback>[].obs;

  void addFeedback(String storyName, int rating) {
    feedbackList.add(CartoonFeedback(storyName, rating));
  }
}
