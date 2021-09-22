import 'package:flutter/material.dart';

import 'package:todoey/widgets/add_task_button.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/constants.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: AddTaskButton(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 25.0,
                left: 20.0,
                right: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Todoey',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.data_usage,
                    color: Colors.white,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
