import 'dart:collection';
import 'package:flutter/foundation.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  int get tasksCount {
    return _tasks.length;
  }

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String task) {
    _tasks.add(Task(title: task));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
