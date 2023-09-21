import 'package:roudy_story_box/view/frames/home/index.dart';

import 'index.dart';

class FeedbackPage extends StatelessWidget {
  final FeedbackController feedbackController = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.creamyYellow,
      appBar: AppBar(
        backgroundColor: AppColors.linearpowderpink,
        title: Text('Stories Feedback'.tr),
      ),
      body: ListView.builder(
        itemCount: feedbackController.feedbackList.length,
        itemBuilder: (context, index) {
          var feedback = feedbackController.feedbackList[index];
          return ListTile(
            title: Text(feedback.storyName),
            subtitle: Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text(feedback.rating.toString()),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showRatingDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showRatingDialog() {
    Get.defaultDialog(
      title: 'Rate Stories'.tr,
      content: RatingDialog(),
    );
  }
}

class RatingDialog extends StatelessWidget {
  final TextEditingController _storyNameController = TextEditingController();
  final RxInt _rating = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _storyNameController,
          decoration: InputDecoration(labelText: 'Story Name'.tr),
        ),
        SizedBox(height: 20),
        Obx(() => RatingStars(
            rating: _rating.value,
            onRatingChanged: (value) => _rating.value = value)),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            final feedbackController = Get.find<FeedbackController>();
            feedbackController.addFeedback(
                _storyNameController.text, _rating.value);
            Get.back();
          },
          child: Text('Submit'.tr),
        ),
      ],
    );
  }
}

class RatingStars extends StatelessWidget {
  final int rating;
  final Function(int) onRatingChanged;

  RatingStars({required this.rating, required this.onRatingChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => IconButton(
          onPressed: () => onRatingChanged(index + 1),
          icon: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
