import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';

class ItemTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<Task>(context);
    return ListTile(
      leading: Text(
        task.content,
        style: TextStyle(
          fontSize: 18.0,
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        isCheck: task.isDone,
        onChanged: (value) {
          task.toggleDone();
        },
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  const TaskCheckBox({
    @required this.isCheck,
    @required this.onChanged,
  });

  final bool isCheck;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      onChanged: onChanged,
      value: isCheck,
    );
  }
}
