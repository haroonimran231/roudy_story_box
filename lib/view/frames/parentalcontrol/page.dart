import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParentalControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parental Control'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Limit Screen Time'),
              subtitle: Text('Set daily usage limits'),
              leading: FaIcon(FontAwesomeIcons.clock),
              trailing: Switch(
                value: true, // Replace with actual value
                onChanged: (newValue) {
                  // Handle switch change
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Content Filtering'),
              subtitle: Text('Filter age-appropriate content'),
              leading: FaIcon(FontAwesomeIcons.filter),
              trailing: Switch(
                value: false, // Replace with actual value
                onChanged: (newValue) {
                  // Handle switch change
                },
              ),
            ),
            // Add more settings here
          ],
        ),
      ),
    );
  }
}

class ParentalControlController extends GetxController {
  var screenTimeLimitEnabled = true.obs;
  var contentFilteringEnabled = false.obs;

  void toggleScreenTimeLimit(bool value) {
    screenTimeLimitEnabled.value = value;
  }

  void toggleContentFiltering(bool value) {
    contentFilteringEnabled.value = value;
  }
}

// GetBuilder<ParentalControlController>(
//   builder: (controller) {
//     return Switch(0
//       value: controller.screenTimeLimitEnabled.value,
//       onChanged: controller.toggleScreenTimeLimit,
//     );
//   },
// )
