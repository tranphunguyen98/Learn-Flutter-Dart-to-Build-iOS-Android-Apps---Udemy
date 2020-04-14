class Task {
  final String content;
  bool isDone;

  Task({this.content, this.isDone = false});

  void toggleDone() {
    print(isDone);
    isDone = !isDone;
  }
}
