import 'package:flutter/material.dart';

import 'category.dart';

class CategoryRoute extends StatelessWidget {
  static const List<String> _categoryNames = [
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const List<Color> _baseColors = [
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: categoryList(
            categoryNames: _categoryNames, baseColors: _baseColors),
      ),
    );
  }

  Widget categoryList({List<String> categoryNames, List<Color> baseColors}) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: categoryNames.length,
      itemBuilder: (context, index) => Category(
        color: baseColors[index],
        icon: Icons.cake,
        text: categoryNames[index],
      ),
    );
  }
}
