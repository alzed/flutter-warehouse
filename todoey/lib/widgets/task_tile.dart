import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final String task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task),
      trailing: Checkbox(
        value: false,
        onChanged: (isDone) {},
        fillColor: MaterialStateProperty.all(Color(0xFF004080)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      ),
    );
  }
}
