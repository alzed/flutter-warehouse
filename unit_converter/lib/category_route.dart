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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _categoryNames.length,
        itemBuilder: (context, index) => Category(
          color: _baseColors[index],
          icon: Icons.cake,
          text: _categoryNames[index],
        ),
      ),
    );
  }
}
