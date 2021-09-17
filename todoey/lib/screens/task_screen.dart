import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF004080),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('You have 0 tasks'),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        ListTile(
                          title: Text('Task1'),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.check_box_outline_blank,
                              color: Color(0xFF004080),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('Task2'),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.check_box_outline_blank,
                              color: Color(0xFF004080),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text('Task3'),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.check_box_outline_blank,
                              color: Color(0xFF004080),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
