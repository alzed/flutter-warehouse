import 'package:flutter/material.dart';

class ConverterRoute extends StatelessWidget {
  ConverterRoute({@required this.category, @required this.color});

  final String category;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: color,
      ),
    );
  }
}
