import 'package:flutter/material.dart';

import 'item_task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ItemTask('This is a task'),
        ItemTask('This is a task1'),
        ItemTask('This is a task2'),
      ],
    );
  }
}
