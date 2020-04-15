class Task {
  final String content;
  bool isDone;

  Task({this.content, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
    print(isDone);
  }
}
