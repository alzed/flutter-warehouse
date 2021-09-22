import 'package:flutter/material.dart';

import 'package:todoey/constants.dart';
import 'package:todoey/screens/add_task_screen.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPrimaryColor,
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => AddTaskScreen(),
        );
      },
    );
  }
}
