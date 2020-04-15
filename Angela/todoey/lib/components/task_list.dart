import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_brain.dart';

import 'item_task.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskBrain>(
      builder: (context, tasks, child) {
        return ListView.builder(
            itemCount: tasks.taskCount,
            itemBuilder: (context, index) => ChangeNotifierProvider<Task>(
                  create: (context) => tasks.listTask[index],
                  child: ItemTask(),
                ));
      },
    );
  }
}
