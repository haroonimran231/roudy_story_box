import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_tts/flutter_tts.dart';

class StoryDisplayPage extends StatefulWidget {
  @override
  _StoryDisplayPageState createState() => _StoryDisplayPageState();
}

// final FlutterTts flutterTts = FlutterTts();
// Initialize Flutter TTS

class _StoryDisplayPageState extends State<StoryDisplayPage> {
  final String textApiUrl =
      'https://api.monsterapi.ai/v1/generate/falcon-7b-instruct';
  final String imageApiUrl = 'https://api.monsterapi.ai/v1/generate/sdxl-base';
  final String apiKey =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Ijc1NWU0Y2ZhYzQ2NTkxZWNmMDM4ZTM2NTQ0N2Q1MTVhIiwiY3JlYXRlZF9hdCI6IjIwMjMtMDktMTFUMDU6MDA6MTIuNzQwMDk0In0.v6w0LBLJxJekt5XJvgbzsB30WDFevgz9bZ6bW3sQccA'; // Replace with your actual API key
  TextEditingController textController = TextEditingController(
    text: 'Write a story of 100 words of', // Initial text
  );
  TextEditingController generatedTextController = TextEditingController();
  double fontSize = 15.0;
  List<String> frameUrls = [];

  // Add a FocusNode to manage the focus of the text field
  final FocusNode _textFocus = FocusNode();

  bool isTTSPlaying = false; // Track TTS playback status

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
    try {
      var request = http.MultipartRequest('POST', Uri.parse(imageApiUrl))
        ..headers['Authorization'] = apiKey
        ..fields['prompt'] = prompt
        ..fields['samples'] = '4' // Number of frames
        ..fields['steps'] = '50' // Sampling steps
        ..fields['aspect_ratio'] = 'portrait'
        ..fields['guidance_scale'] = '5'
        ..fields['negprompt'] = 'blurry,real objects,nsfw,ads,realistic, '
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
    try {
      while (true) {
        var response = await http
            .get(Uri.parse(statusUrl), headers: {'Authorization': apiKey});
        if (response.statusCode == 200) {
          var jsonResponse = json.decode(response.body);
          print('Status Response: $jsonResponse');
          var status = jsonResponse['status'];

          if (status == 'COMPLETED') {
            var frameList = jsonResponse['result']['output'];
            setState(() {
              frameUrls = List<String>.from(frameList);
            });
            break;
          } else if (status == 'FAILED') {
            print('Image generation failed.');
            break;
          } else {
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

  // Future<void> speakGeneratedStory() async {
  //   if (generatedTextController.text.isNotEmpty) {
  //     await flutterTts.setLanguage('en-US');
  //     await flutterTts.setPitch(1.0);

  //     // Set the TTS playback status to true when playback starts
  //     setState(() {
  //       isTTSPlaying = true;
  //     });

  //     await flutterTts.speak(generatedTextController.text);

  //     // Set the TTS playback status to false when playback completes
  //     setState(() {
  //       isTTSPlaying = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF1D0),
      body: GestureDetector(
        onTap: () {
          if (_textFocus.hasFocus) {
            _textFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
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
                  // Row(
                  //   children: [
                  //     IconButton(
                  //       icon: Icon(Icons.arrow_back),
                  //       onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DashboardPage(),
                  //   ),
                  // );
                  //       },
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: TextField(
                      controller: textController,
                      focusNode: _textFocus,
                      decoration: InputDecoration(
                        labelText: 'Enter Text For Story',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () {
                        if (textController.text ==
                            'Write a story of 100 words for the user') {
                          textController.clear();
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String prompt = textController.text;
                      if (prompt.isNotEmpty) {
                        makeAnimatedImageRequest(prompt);
                        makeAnimatedTextRequest(prompt);
                      } else {
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
                          fontSize: 18,
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
                  // Stack(
                  //   alignment: Alignment.center,
                  //   children: [
                  //     ElevatedButton(
                  //       onPressed: speakGeneratedStory,
                  //       child: Text('Read Story'),
                  //     ),
                  //     if (isTTSPlaying) // Show a loading indicator when TTS is playing
                  //       CircularProgressIndicator(),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
