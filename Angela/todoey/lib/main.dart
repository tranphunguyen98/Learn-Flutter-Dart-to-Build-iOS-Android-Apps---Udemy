import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_brain.dart';
import 'package:todoey/screens/task_screen.dart';

void main() => runApp(Todoey());

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskBrain>(
      create: (context) => TaskBrain(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(primaryColor: Colors.lightBlueAccent),
        home: TaskScreen(),
      ),
    );
  }
}
