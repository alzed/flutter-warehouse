import 'package:flutter/material.dart';

import 'category_route.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UnitConverter',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          title: Text(
            'UNIT CONVERTER',
            style: TextStyle(fontSize: 30.0, color: Colors.black),
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        backgroundColor: Colors.green[100],
        body: CategoryRoute(),
      ),
    );
  }
}
