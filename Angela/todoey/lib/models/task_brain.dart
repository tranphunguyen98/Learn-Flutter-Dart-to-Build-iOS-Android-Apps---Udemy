import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskBrain with ChangeNotifier {
  List<Task> _listTask = [
    Task(content: 'Task 1'),
    Task(content: 'Task 2'),
    Task(content: 'Task 3'),
  ];

  UnmodifiableListView<Task> get listTask {
    return UnmodifiableListView(_listTask);
  }

  int get taskCount => _listTask.length;

  void addTask(Task task) {
    _listTask.add(task);
    notifyListeners();
  }
}
