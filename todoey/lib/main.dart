import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/task_data.dart';
import 'screens/task_screen.dart';

void main() {
  runApp(TodoeyApp());
}

class TodoeyApp extends StatelessWidget {
  const TodoeyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
