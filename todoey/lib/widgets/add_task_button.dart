import 'package:flutter/material.dart';

import 'package:todoey/screens/add_task_screen.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    Key? key,
    required this.addTaskCallback,
  }) : super(key: key);

  final Function addTaskCallback;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF004080),
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => AddTaskScreen(
            addTaskCallback: addTaskCallback,
          ),
        );
      },
    );
  }
}
