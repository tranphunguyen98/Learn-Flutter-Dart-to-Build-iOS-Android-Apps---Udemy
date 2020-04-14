import 'package:flutter/material.dart';
import 'package:todoey/screens/task_screen.dart';

void main() => runApp(Todoey());

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(primaryColor: Colors.lightBlueAccent),
      home: TaskScreen(),
    );
  }
}
