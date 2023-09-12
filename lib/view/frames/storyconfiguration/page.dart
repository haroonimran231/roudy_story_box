import 'package:flutter/material.dart';
import 'package:roudy_story_box/common/color/color.dart';
import 'package:roudy_story_box/view/frames/storyconfiguration/latest.dart';
import 'package:roudy_story_box/view/frames/storyconfiguration/bookitem.dart';
import 'package:roudy_story_box/view/frames/storyconfiguration/popular.dart';

class StoryConfiguration extends StatelessWidget {
  const StoryConfiguration({super.key});
  // static List<latestBooksInfo>=["assets/images/home.png",];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.linearpowderpink,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.vertical_distribute_rounded,
                ),
              )),
              Icon(Icons.search_rounded),
              SizedBox(
                width: 15,
              ),
              Badge(
                alignment: Alignment(-10, -10),
                label: Text(
                  "-1",
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.shopping_bag_rounded),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(1, 1)),
                ],
              ),
              child: TabBar(
                  indicatorColor: AppColors.linearpowderpink,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  labelPadding: EdgeInsets.only(top: 10),
                  // labelColor: AppColors.linearpowderpink,
                  unselectedLabelColor: Colors.grey[900],
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Text(
                      "New Stories",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text("Popular Stories",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ]),
            ),
            Expanded(
              flex: 4,
              child: TabBarView(
                children: [
                  ListView(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    // children: getNewBooks()
                  ),
                  ListView(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    // children: getPopularBooks()
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getNewBooks() {
    return List.generate(latestBooksInfo.length,
        (index) => BookItem(book: latestBooksInfo[index]));
  }

  getPopularBooks() {
    return List.generate(popularBooksInfo.length,
        (index) => BookItem(book: popularBooksInfo[index]));
  }
}
