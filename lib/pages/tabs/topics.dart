import 'package:flutter/material.dart';

import '../../models/topic/topics_list_entity.dart';

class TopicsListPage extends StatefulWidget {
  @override
  _TopicsListPageState createState() => _TopicsListPageState();
}

class _TopicsListPageState extends State<TopicsListPage> {
  var topicsList = new TopicsListEntity().data.topics;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              var topic = topicsList[index];
              return ListTile(
                title: Text(topic.title),
                subtitle: Text(topic.name),
                trailing: Text(topic.ctime),
                onTap: () {
                  Navigator.pushNamed(context, '/topic/detail',
                      arguments: topic);
                },
              );
            },
            separatorBuilder: (context, index) => Divider(
                  height: .0,
                ),
            itemCount: this.topicsList.length));
  }
}
