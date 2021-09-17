import 'package:flutter/material.dart';

import 'package:todoey/screens/add_task_screen.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF004080),
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Add task'),
          ),
        );
      },
    );
  }
}
