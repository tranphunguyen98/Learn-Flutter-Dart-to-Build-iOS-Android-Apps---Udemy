import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskBrain with ChangeNotifier {
  List<Task> listTask = [
    Task(content: 'Task 1'),
    Task(content: 'Task 2'),
    Task(content: 'Task 3'),
  ];

  void addTask(Task task) {
    listTask.add(task);
    notifyListeners();
  }
}
