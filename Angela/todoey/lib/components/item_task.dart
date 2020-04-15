import 'package:flutter/material.dart';

class ItemTask extends StatelessWidget {
  final String text;
  final bool isDone;
  final Function toggleDone;
  final Function deleteTask;

  ItemTask({this.text, this.isDone, this.toggleDone, this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTask,
      leading: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        isCheck: isDone,
        onChanged: (value) {
          toggleDone();
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
