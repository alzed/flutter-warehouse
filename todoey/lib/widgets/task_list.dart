import 'package:flutter/material.dart';

import 'package:todoey/models/task.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(title: 'Task 1'),
    Task(title: 'Task 2'),
    Task(title: 'Task 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('You have ${tasks.length} tasks'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (context, int index) {
            return TaskTile(task: tasks[index].title);
          },
        ),
      ],
    );
  }
}
