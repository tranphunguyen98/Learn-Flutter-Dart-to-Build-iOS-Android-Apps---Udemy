import 'package:flutter/material.dart';

class ItemTask extends StatefulWidget {
  final String taskText;
  ItemTask(this.taskText);
  @override
  _ItemTaskState createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  bool isCheck = false;

  void changeCheck(bool value) {
    setState(() {
      isCheck = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        widget.taskText,
        style: TextStyle(
          decoration: isCheck ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        isCheck: isCheck,
        onChanged: changeCheck,
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
