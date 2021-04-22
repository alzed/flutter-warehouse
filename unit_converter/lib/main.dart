import 'package:flutter/material.dart';

import 'category.dart';

void main() {
  runApp(UnitConverterApp());
}

const _categoryName = 'Cake';
const _categoryIcon = Icons.cake;
const _categoryColor = Colors.green;

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UnitConverter',
      home: Scaffold(
        backgroundColor: Colors.green[10],
        body: Center(
          child: Category(
            color: _categoryColor,
            icon: _categoryIcon,
            text: _categoryName,
          ),
        ),
      ),
    );
  }
}
