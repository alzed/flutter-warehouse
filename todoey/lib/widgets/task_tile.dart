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
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.check_box_outline_blank,
          color: Color(0xFF004080),
        ),
      ),
    );
  }
}
