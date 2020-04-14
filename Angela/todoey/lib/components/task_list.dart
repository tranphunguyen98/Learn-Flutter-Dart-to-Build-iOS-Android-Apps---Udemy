import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

import 'item_task.dart';

class TaskList extends StatelessWidget {
  final List<Task> listTask;
  final checkBoxCallBack;
  TaskList({this.listTask, this.checkBoxCallBack});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listTask.length,
        itemBuilder: (context, index) => ItemTask(
              taskText: listTask[index].content,
              isDone: listTask[index].isDone,
              checkBoxCallBack: (state) {
                checkBoxCallBack(state, index);
              },
            ));
  }
}
