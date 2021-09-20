import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoey/models/task_data.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'You have ${taskData.tasksCount} tasks',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Color(0xFF004080),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: taskData.tasksCount,
            itemBuilder: (context, int index) {
              return TaskTile(
                task: taskData.tasks[index].title,
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (bool? value) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                deleteTaskCallback: () {
                  taskData.deleteTask(taskData.tasks[index]);
                },
              );
            },
          ),
        ],
      );
    });
  }
}
