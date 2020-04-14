import 'package:flutter/foundation.dart';

class Task with ChangeNotifier {
  final String content;
  bool isDone;

  Task({this.content, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
    print(isDone);
    notifyListeners();
  }
}
