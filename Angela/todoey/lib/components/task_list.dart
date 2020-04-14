import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_brain.dart';

import 'item_task.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listTask = Provider.of<TaskBrain>(context).listTask;
    return ListView.builder(
        itemCount: listTask.length,
        itemBuilder: (context, index) => ChangeNotifierProvider<Task>(
              create: (context) => listTask[index],
              child: ItemTask(),
            ));
  }
}
