import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roudy_story_box/view/frames/profilecreation/index.dart';
import 'package:roudy_story_box/view/frames/storyconfiguration/avator.dart';
import 'package:roudy_story_box/view/frames/storyconfiguration/model2.dart';

class BookCard extends StatelessWidget {
  BookCard({Key? key, required this.popularBook}) : super(key: key);
  final Books popularBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 300,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: AvatarImage(
                popularBook.image,
                height: 130,
                radius: 8,
                isSVG: false,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(popularBook.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.linearpowderpink,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 8,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: popularBook.price,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.linearpowderpink,
                        fontWeight: FontWeight.w500)),
                TextSpan(text: "   "),
                TextSpan(
                    text: popularBook.originalPrice,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.w500)),
              ]))
        ],
      ),
    );
  }
}
