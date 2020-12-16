import 'package:flutter/material.dart';
import 'topics.dart';
import '../home.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final barTitles = ["豆瓣电影Top250", "灌水区"];
  int idx = 0;
  List tabPagesList = [Home1(), TopicsListPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${barTitles[idx]}"),
      ),
      body: tabPagesList[idx],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 16,
        currentIndex: idx,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie_filter_rounded), label: '豆瓣'),
          BottomNavigationBarItem(icon: Icon(Icons.topic), label: '灌水')
        ],
        onTap: (index){
          setState(() {
            this.idx = index;
          });
        },
      ),
    );
  }
}
