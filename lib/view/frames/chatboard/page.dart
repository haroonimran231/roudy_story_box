import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roudy_story_box/common/color/color.dart';

class Chatboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightLavender,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/appbar.png'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jimmy'.tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Online'.tr,
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
        actions: [Icon(Icons.chat)],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/chatboard.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ChatBubble(isMe: false, message: 'hello jimmy!'.tr),
                        ChatBubble(isMe: true, message: 'yes'.tr),
                        ChatBubble(isMe: false, message: 'how are you'.tr),
                        ChatBubble(isMe: true, message: 'fine'.tr),
                        ChatBubble(isMe: false, message: 'good'.tr),
                        ChatBubble(
                            isMe: true, message: 'what are yoy doing?'.tr),
                        ChatBubble(isMe: false, message: 'nothing special'.tr),
                        ChatBubble(
                            isMe: true, message: 'why you are so busy? '.tr),
                        ChatBubble(
                            isMe: false, message: 'No, I am anot busy'.tr),
                        ChatBubble(isMe: true, message: 'Hi Jimmy!'.tr),
                        ChatBubble(isMe: false, message: 'Hey there!'.tr),
                        ChatBubble(isMe: true, message: 'Hi Jimmy!'.tr),
                        ChatBubble(isMe: false, message: 'Hey there!'.tr),
                        ChatBubble(isMe: true, message: 'Hi Jimmy!'.tr),
                        // Add more ChatBubble widgets for more messages
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...'.tr,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Send message logic
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String message;

  ChatBubble({required this.isMe, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message,
          style: TextStyle(color: isMe ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
