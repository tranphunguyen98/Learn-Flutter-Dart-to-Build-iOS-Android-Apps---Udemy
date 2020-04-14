import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

import 'item_task.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> listTask = [Task(content: 'Task 1'), Task(content: 'Task 2')];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listTask.length,
        itemBuilder: (context, index) => ItemTask(
              taskText: listTask[index].content,
              isDone: listTask[index].isDone,
              checkBoxCallBack: (newState) {
                setState(() {
                  listTask[index].toggleDone();
                });
              },
            ));
  }
}
