import 'package:flutter/material.dart';

class ItemTask extends StatefulWidget {
  final String taskText;
  ItemTask(this.taskText);
  @override
  _ItemTaskState createState() => _ItemTaskState();
}

class _ItemTaskState extends State<ItemTask> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        widget.taskText,
        style: TextStyle(color: !isCheck ? Colors.black : Colors.red),
      ),
      trailing: Checkbox(
        onChanged: (value) {
          setState(() {
            isCheck = value;
          });
        },
        value: isCheck,
      ),
    );
  }
}
