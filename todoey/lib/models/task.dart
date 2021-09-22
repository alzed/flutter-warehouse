class Task {
  Task({required this.title, required this.priority, this.isDone = false});

  final String title;
  final int priority;
  bool isDone;

  void toggleDone() {
    isDone = !isDone;
  }
}
