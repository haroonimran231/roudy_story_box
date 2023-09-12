// import 'package:flutter/material.dart';
// import 'package:roudy_story_box/view/frames/picture/model.dart';

// class PictureScreen extends StatefulWidget {
//   const PictureScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _PictureScreenState createState() => _PictureScreenState();
// }

// class _PictureScreenState extends State<PictureScreen> {
//   late Future<Picture> picture;

//   @override
//   void initState() {
//     super.initState();
//     picture = fetchPicture();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Picture Screen'),
//       ),
//       body: Center(
//         child: FutureBuilder<Picture>(
//           future: picture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               final pictureData = snapshot.data!;
//               // Use the pictureData to display information on the screen
//               return Text(
//                   'Process ID: ${pictureData.processId},result: ${pictureData.result}');
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MonsterApiDemo extends StatefulWidget {
//   @override
//   _MonsterApiDemoState createState() => _MonsterApiDemoState();
// }

// class _MonsterApiDemoState extends State<MonsterApiDemo> {
//   final String apiUrl =
//       'https://api.monsterapi.ai/v1/generate/falcon-7b-instruct';
//   final String apiKey =
//       'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ijc1NWU0Y2ZhYzQ2NTkxZWNmMDM4ZTM2NTQ0N2Q1MTVhIiwiY3JlYXRlZF9hdCI6IjIwMjMtMDktMDhUMDU6MTk6MjMuNzQwODQwIn0.ZFsjbPrwk4OZpNCCeJzmc9BbB6WhPeY8MTp5_AQkbM4'; // Replace with your actual API key
//   TextEditingController textController = TextEditingController();
//   TextEditingController generatedTextController = TextEditingController();

//   Future<void> makeAnimatedTextRequest(String prompt) async {
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
//         ..headers['Authorization'] = apiKey
//         ..fields['prompt'] = prompt;

//       var response = await request.send();

//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(await response.stream.bytesToString());

//         if (jsonResponse != null && jsonResponse.containsKey('status_url')) {
//           var statusUrl = jsonResponse['status_url'];
//           await pollStatusAndFetchText(statusUrl);
//         } else {
//           print('API Response does not contain "status_url".');
//         }
//       } else {
//         print('API Request Failed: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> pollStatusAndFetchText(String statusUrl) async {
//     try {
//       while (true) {
//         var response = await http
//             .get(Uri.parse(statusUrl), headers: {'Authorization': apiKey});
//         if (response.statusCode == 200) {
//           var jsonResponse = json.decode(response.body);
//           print('Status Response: $jsonResponse');
//           var status = jsonResponse['status'];

//           if (status == 'COMPLETED') {
//             // The generation process is completed, fetch the generated text if available
//             var result = jsonResponse['result'];
//             if (result != null && result.containsKey('text')) {
//               var generatedText = result['text'];
//               setState(() {
//                 generatedTextController.text = generatedText;
//               });
//             }
//             break;
//           } else if (status == 'FAILED') {
//             print('Text generation failed.');
//             break;
//           } else {
//             // The process is still in progress, wait for a while before checking again
//             await Future.delayed(Duration(seconds: 5));
//           }
//         } else {
//           print('Status Check Failed: ${response.statusCode}');
//           break;
//         }
//       }
//     } catch (e) {
//       print('Error polling status: $e');
//     }
//   }

//   @override
//   void dispose() {
//     textController.dispose();
//     generatedTextController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Monster API Text Generation Demo'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             TextField(
//               controller: textController,
//               decoration: InputDecoration(
//                 labelText: 'Enter Text Prompt',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 String prompt = textController.text;
//                 if (prompt.isNotEmpty) {
//                   makeAnimatedTextRequest(prompt);
//                 } else {
//                   // Handle empty text input
//                   print('Please enter a text prompt.');
//                 }
//               },
//               child: Text('Generate Text'),
//             ),
//             SizedBox(height: 20), // Add spacing
//             TextField(
//               controller: generatedTextController,
//               readOnly: true,
//               maxLines: null, // Allow multiline text
//               decoration: InputDecoration(
//                 labelText: 'Generated Text',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class PictureScreen extends StatefulWidget {
//   @override
//   _PictureScreenState createState() => _PictureScreenState();
// }

// class _PictureScreenState extends State<PictureScreen> {
//   final String apiUrl = 'https://api.monsterapi.ai/v1/generate/sdxl-base';
//   final String apiKey =
//       'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6IjRjMGFkNmNiYWQ4YmZkMDVmOWQ3ZjEwNThkYjY3ZjIwIiwiY3JlYXRlZF9hdCI6IjIwMjMtMDktMDVUMDk6NTY6MDMuOTc1NTY2In0.7ib-0U7lUuomtqckzZEMF-D7ldVorNiNTcg2hrTW0kc'; // Replace with your actual API key
//   List<String> frameUrls = [];
//   TextEditingController textController = TextEditingController();

//   Future<void> animatedPics(String prompt) async {
//     try {
//       var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
//         ..headers['Authorization'] = apiKey
//         ..fields['prompt'] = prompt
//         ..fields['samples'] = '1' // Number of frames
//         ..fields['steps'] = '30' // Sampling steps
//         ..fields['aspect_ratio'] = 'landscape'
//         ..fields['guidance_scale'] = '12.5'
//         ..fields['style'] = 'anime'; // Set

//       var response = await request.send();

//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(await response.stream.bytesToString());

//         if (jsonResponse != null && jsonResponse.containsKey('status_url')) {
//           var statusUrl = jsonResponse['status_url'];
//           await pollStatusAndFetchFrames(statusUrl);
//         } else {
//           print('API Response exist "status_url".');
//         }
//       } else {
//         print('API Req Failed: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   Future<void> pollStatusAndFetchFrames(String statusUrl) async {
//     try {
//       while (true) {
//         var response = await http
//             .get(Uri.parse(statusUrl), headers: {'Authorization': apiKey});
//         if (response.statusCode == 200) {
//           var jsonResponse = json.decode(response.body);
//           print('Status Response: $jsonResponse');
//           var status = jsonResponse['status'];

//           if (status == 'COMPLETED') {
//             // The generation process is completed, fetch the frames
//             var frameList = jsonResponse['result']['output'];
//             setState(() {
//               frameUrls = List<String>.from(frameList);
//             });
//             break;
//           } else if (status == 'FAILED') {
//             print('Image generation failed.');
//             break;
//           } else {
//             // The process is still in progress, wait for a while before checking again
//             await Future.delayed(Duration(seconds: 5));
//           }
//         } else {
//           print('Status Check Failed: ${response.statusCode}');
//           break;
//         }
//       }
//     } catch (e) {
//       print('Error polling status: $e');
//     }
//   }

//   @override
//   void dispose() {
//     textController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('Text To Image Generation'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 14,
//             ),
//             TextField(
//               controller: textController,
//               decoration: InputDecoration(
//                 // fillColor: Colors.red,
//                 labelText: 'Text for Image',
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black)),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 String prompt = textController.text;
//                 if (prompt.isNotEmpty) {
//                   animatedPics(prompt);
//                 } else {
//                   // Handle empty text input
//                   print('Please enter some text.');
//                 }
//               },
//               child: Text('Generate'),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: frameUrls.length,
//                 itemBuilder: (context, index) {
//                   return Image.network(frameUrls[index]);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StoryDisplayPage extends StatefulWidget {
  @override
  _StoryDisplayPageState createState() => _StoryDisplayPageState();
}

class _StoryDisplayPageState extends State<StoryDisplayPage> {
  final String textApiUrl =
      'https://api.monsterapi.ai/v1/generate/falcon-7b-instruct';
  final String imageApiUrl = 'https://api.monsterapi.ai/v1/generate/sdxl-base';
  final String apiKey =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6IjRjMGFkNmNiYWQ4YmZkMDVmOWQ3ZjEwNThkYjY3ZjIwIiwiY3JlYXRlZF9hdCI6IjIwMjMtMDktMDVUMDk6NTY6MDMuOTc1NTY2In0.7ib-0U7lUuomtqckzZEMF-D7ldVorNiNTcg2hrTW0kc'; // Replace with your actual API key
  TextEditingController textController = TextEditingController(
    text: 'Write a story in 100 words of', // Initial text
  );
  TextEditingController generatedTextController = TextEditingController();
  double fontSize = 15.0;
  List<String> frameUrls = [];

  // Add a FocusNode to manage the focus of the text field
  final FocusNode _textFocus = FocusNode();

  Future<void> makeAnimatedTextRequest(String prompt) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(textApiUrl))
        ..headers['Authorization'] = apiKey
        ..fields['prompt'] = prompt;

      var response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(await response.stream.bytesToString());

        if (jsonResponse != null && jsonResponse.containsKey('status_url')) {
          var statusUrl = jsonResponse['status_url'];
          await pollStatusAndFetchText(statusUrl);
        } else {
          print('API Response does not contain "status_url".');
        }
      } else {
        print('API Request Failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> pollStatusAndFetchText(String statusUrl) async {
    try {
      while (true) {
        var response = await http
            .get(Uri.parse(statusUrl), headers: {'Authorization': apiKey});
        if (response.statusCode == 200) {
          var jsonResponse = json.decode(response.body);
          print('Status Response: $jsonResponse');
          var status = jsonResponse['status'];

          if (status == 'COMPLETED') {
            // The generation process is completed, fetch the generated text if available
            var result = jsonResponse['result'];
            if (result != null && result.containsKey('text')) {
              var generatedText = result['text'];
              setState(() {
                generatedTextController.text = generatedText;
                // Calculate the font size based on image size
                fontSize =
                    generatedTextController.text.length < 100 ? 15.0 : 12.0;
              });
            }
            break;
          } else if (status == 'FAILED') {
            print('Text generation failed.');
            break;
          } else {
            // The process is still in progress, wait for a while before checking again
            await Future.delayed(Duration(seconds: 5));
          }
        } else {
          print('Status Check Failed: ${response.statusCode}');
          break;
        }
      }
    } catch (e) {
      print('Error polling status: $e');
    }
  }

  Future<void> makeAnimatedImageRequest(String prompt) async {
    // Implement image generation request here
    try {
      // Create an HTTP request to generate images
      // You need to set the appropriate headers and parameters
      // Similar to what you did for text generation
      var request = http.MultipartRequest('POST', Uri.parse(imageApiUrl))
        ..headers['Authorization'] = apiKey
        ..fields['prompt'] = prompt
        ..fields['samples'] = '2' // Number of frames
        ..fields['steps'] = '30' // Sampling steps
        ..fields['aspect_ratio'] = 'landscape'
        ..fields['guidance_scale'] = '12.5'
        ..fields['style'] = 'anime';
      var response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(await response.stream.bytesToString());

        if (jsonResponse != null && jsonResponse.containsKey('status_url')) {
          var statusUrl = jsonResponse['status_url'];
          await pollStatusAndFetchFrames(statusUrl);
        } else {
          print('API Response does not contain "status_url".');
        }
      } else {
        print('API Request Failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> pollStatusAndFetchFrames(String statusUrl) async {
    // Implement polling for image generation status and fetching frames here
    try {
      while (true) {
        var response = await http
            .get(Uri.parse(statusUrl), headers: {'Authorization': apiKey});
        if (response.statusCode == 200) {
          var jsonResponse = json.decode(response.body);
          print('Status Response: $jsonResponse');
          var status = jsonResponse['status'];

          if (status == 'COMPLETED') {
            // The generation process is completed, fetch the frames
            var frameList = jsonResponse['result']['output'];
            setState(() {
              frameUrls = List<String>.from(frameList);
            });
            break;
          } else if (status == 'FAILED') {
            print('Image generation failed.');
            break;
          } else {
            // The process is still in progress, wait for a while before checking again
            await Future.delayed(Duration(seconds: 5));
          }
        } else {
          print('Status Check Failed: ${response.statusCode}');
          break;
        }
      }
    } catch (e) {
      print('Error polling status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 234, 9),
      body: GestureDetector(
        onTap: () {
          // Close the keyboard when tapping anywhere on the screen
          if (_textFocus.hasFocus) {
            _textFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          // Wrap the content in a SingleChildScrollView
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/b.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Back Button
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          // Handle back button press
                        },
                      ),
                    ],
                  ),

                  // Text Field
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TextField(
                      controller: textController,
                      focusNode:
                          _textFocus, // Assign the focus node to the text field
                      decoration: InputDecoration(
                        labelText: 'Enter Text For Story',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () {
                        if (textController.text ==
                            'Write a story in 100 words for the user') {
                          textController
                              .clear(); // Clear the default text when tapped
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String prompt = textController.text;
                      if (prompt.isNotEmpty) {
                        makeAnimatedTextRequest(prompt);
                        makeAnimatedImageRequest(prompt);
                      } else {
                        // Handle empty text input
                        print('Please Enter Story.');
                      }
                    },
                    child: Text('Generate Story and Image'),
                  ),
                  if (generatedTextController.text.isNotEmpty)
                    Container(
                      padding: EdgeInsets.all(16),
                      color: Color(0xFFFFF1D0).withOpacity(0.1),
                      child: Text(
                        generatedTextController.text,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'IndieFlower',
                        ),
                      ),
                    ),
                  if (frameUrls.isNotEmpty)
                    Column(
                      children: frameUrls.map((frameUrl) {
                        return Image.network(frameUrl);
                      }).toList(),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
