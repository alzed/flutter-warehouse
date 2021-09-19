import 'package:flutter/material.dart';

import 'package:todoey/models/task.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList(
    this.tasks, {
    Key? key,
  }) : super(key: key);

  final List<Task> tasks;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('You have ${widget.tasks.length} tasks'),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.tasks.length,
          itemBuilder: (context, int index) {
            return TaskTile(
              task: widget.tasks[index].title,
              isChecked: widget.tasks[index].isDone,
              checkboxCallback: (bool? value) {
                setState(() {
                  widget.tasks[index].toggleDone();
                });
              },
            );
          },
        ),
      ],
    );
  }
}
