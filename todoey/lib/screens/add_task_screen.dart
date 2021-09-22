import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/priority_card.dart';
import 'package:todoey/constants.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final controller = TextEditingController();
  int priority = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black54,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          child: Column(
            children: [
              TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(hintText: 'Task'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Row(
                      children: [
                        PriorityCard(
                          priority: 1,
                          currentPriority: priority,
                          onPressed: () {
                            setState(() {
                              priority = 1;
                            });
                          },
                        ),
                        PriorityCard(
                          priority: 2,
                          currentPriority: priority,
                          onPressed: () {
                            setState(() {
                              priority = 2;
                            });
                          },
                        ),
                        PriorityCard(
                          priority: 3,
                          currentPriority: priority,
                          onPressed: () {
                            setState(() {
                              priority = 3;
                            });
                          },
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.check,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        Provider.of<TaskData>(context, listen: false)
                            .addTask(controller.text, priority);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
