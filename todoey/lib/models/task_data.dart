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

  int get completedTasksCount {
    int count = 0;
    _tasks.forEach((element) {
      count += element.isDone ? 1 : 0;
    });
    return count;
  }

  void addTask(String task, int priority) {
    _tasks.add(Task(title: task, priority: priority));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
