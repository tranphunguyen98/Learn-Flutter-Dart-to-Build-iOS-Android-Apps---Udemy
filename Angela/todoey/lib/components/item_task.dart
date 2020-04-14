import 'package:flutter/material.dart';

class ItemTask extends StatelessWidget {
  final String taskText;
  final bool isDone;
  final Function checkBoxCallBack;

  ItemTask({this.taskText, this.isDone, this.checkBoxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        taskText,
        style: TextStyle(
          fontSize: 18.0,
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        isCheck: isDone,
        onChanged: checkBoxCallBack,
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
