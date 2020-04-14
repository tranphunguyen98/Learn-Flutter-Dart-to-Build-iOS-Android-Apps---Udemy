import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTask;
  final taskTextController = TextEditingController();

  AddTaskScreen({@required this.addTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: taskTextController,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 8.0,
            ),
            FlatButton(
              onPressed: () {
                addTask(Task(content: taskTextController.text));
                Navigator.pop(context);
              },
              child: Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
