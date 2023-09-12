// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Picture {
//   String? processId;
//   String? status;
//   Result? result;
//   double? creditUsed;
//   double? overage;

//   Picture(
//       {this.processId,
//       this.status,
//       this.result,
//       this.creditUsed,
//       this.overage});

//   Picture.fromJson(Map<String, dynamic> json) {
//     processId = json['process_id'];
//     status = json['status'];
//     result = json['result'] != null ? Result.fromJson(json['result']) : null;
//     creditUsed = json['credit_used'];
//     overage = json['overage'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['process_id'] = processId;
//     data['status'] = status;
//     if (result != null) {
//       data['result'] = result!.toJson();
//     }
//     data['credit_used'] = creditUsed;
//     data['overage'] = overage;
//     return data;
//   }
// }

// class Result {
//   List<String>? output;

//   Result({this.output});

//   Result.fromJson(Map<String, dynamic> json) {
//     output = json['output'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['output'] = output;
//     return data;
//   }
// }

// Future<Picture> fetchPicture() async {
//   final response = await http.get(
//     Uri.parse(
//         'https://api.monsterapi.ai/v1/status/7ced1fd0-0307-4873-b800-42fdd45325ef'),
//     headers: <String, String>{
//       'authorization':
//           'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6IjRjMGFkNmNiYWQ4YmZkMDVmOWQ3ZjEwNThkYjY3ZjIwIiwiY3JlYXRlZF9hdCI6IjIwMjMtMDktMDVUMDk6NTY6MDMuOTc1NTY2In0.7ib-0U7lUuomtqckzZEMF-D7ldVorNiNTcg2hrTW0kc',
//     },
//   );
//   if (response.statusCode == 200) {
//     return Picture.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load picture');
//   }
// }

// Future<Picture> postPicture(Picture picture) async {
//   final response = await http.post(
//     Uri.parse('https://api.monsterapi.ai/v1/generate/txt2img'),
//     headers: <String, String>{
//       'authorization':
//           'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6IjRjMGFkNmNiYWQ4YmZkMDVmOWQ3ZjEwNThkYjY3ZjIwIiwiY3JlYXRlZF9hdCI6IjIwMjMtMDktMDVUMDk6NTY6MDMuOTc1NTY2In0.7ib-0U7lUuomtqckzZEMF-D7ldVorNiNTcg2hrTW0kc',
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(picture.toJson()),
//   );
//   if (response.statusCode == 200) {
//     return Picture.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to upload picture');
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PictureScreen extends StatefulWidget {
  @override
  _PictureScreenState createState() => _PictureScreenState();
}

class _PictureScreenState extends State<PictureScreen> {
  final String apiUrl =
      'https://api.monsterapi.ai/v1/generate/falcon-7b-instruct';
  //   final String apiUrl2 =
  // 'https://api.monsterapi.ai/v1/generate/falcon-7b-instruct';
  final String apiKey =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6IjRjMGFkNmNiYWQ4YmZkMDVmOWQ3ZjEwNThkYjY3ZjIwIiwiY3JlYXRlZF9hdCI6IjIwMjMtMDktMDVUMDk6NTY6MDMuOTc1NTY2In0.7ib-0U7lUuomtqckzZEMF-D7ldVorNiNTcg2hrTW0kc'; // Replace with your actual API key
  TextEditingController textController = TextEditingController();
  TextEditingController generatedTextController = TextEditingController();

  Future<void> textGeneration(String prompt) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
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

  @override
  void dispose() {
    textController.dispose();
    generatedTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Monster API Text Generation Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 14,
            ),
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter Text Prompt',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String prompt = textController.text;
                if (prompt.isNotEmpty) {
                  textGeneration(prompt);
                } else {
                  // Handle empty text input
                  print('Please enter a text prompt.');
                }
              },
              child: Text('Generate Text'),
            ),
            SizedBox(height: 20), // Add spacing
            TextField(
              controller: generatedTextController,
              readOnly: true,
              maxLines: null, // Allow multiline text
              decoration: InputDecoration(
                labelText: 'Generated Text',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
