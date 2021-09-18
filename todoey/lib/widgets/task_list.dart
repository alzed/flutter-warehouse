import 'package:flutter/material.dart';

import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('You have 0 tasks'),
        ListView(
          shrinkWrap: true,
          children: [
            TaskTile(task: 'Task 1'),
            TaskTile(task: 'Task 2'),
            TaskTile(task: 'Task 3'),
          ],
        ),
      ],
    );
  }
}
