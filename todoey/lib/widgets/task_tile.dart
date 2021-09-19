import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    Key? key,
    required this.task,
    required this.isChecked,
    required this.checkboxCallback,
  }) : super(key: key);

  final String task;
  final bool isChecked;
  final Function(bool?) checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: checkboxCallback,
        fillColor: MaterialStateProperty.all(Color(0xFF004080)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
          side: BorderSide(
            color: Color(0xFF004080),
          ),
        ),
      ),
    );
  }
}
