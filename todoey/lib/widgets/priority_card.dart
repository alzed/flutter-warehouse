import 'package:flutter/material.dart';

import 'package:todoey/constants.dart';

class PriorityCard extends StatelessWidget {
  PriorityCard({
    Key? key,
    required this.priority,
    required this.currentPriority,
    required this.onPressed,
  }) : super(key: key);

  final int priority;
  final int currentPriority;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: currentPriority == priority
          ? kPriorityList[priority]
          : kPriorityList[0],
      elevation: 0.0,
      child: IconButton(
        icon: Icon(Icons.warning_outlined),
        onPressed: onPressed,
        color: currentPriority == priority
            ? kPriorityList[0]
            : kPriorityList[priority],
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
