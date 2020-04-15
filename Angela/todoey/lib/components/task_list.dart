import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_brain.dart';

import 'item_task.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskBrain>(
      builder: (context, taskBrain, child) {
        return ListView.builder(
          itemCount: taskBrain.taskCount,
          itemBuilder: (context, index) {
            final task = taskBrain.listTask[index];
            return ItemTask(
                text: task.content,
                isDone: task.isDone,
                toggleDone: () {
                  taskBrain.toggleDone(task);
                },
                deleteTask: () {
                  taskBrain.deleteTask(task);
                });
          },
        );
      },
    );
  }
}
