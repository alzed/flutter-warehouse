import 'package:flutter/material.dart';

import 'category.dart';

class CategoryScreen extends StatelessWidget {
  static const List<String> _categoryNames = [
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
    'Cryptocurrency'
  ];

  static List<Color> _baseColors = [
    Colors.teal[100],
    Colors.orange[100],
    Colors.pinkAccent[100],
    Colors.blueAccent[100],
    Colors.yellow[100],
    Colors.green[200],
    Colors.purpleAccent[100],
    Colors.red[100],
    Colors.grey,
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
      body:
          categoryList(categoryNames: _categoryNames, baseColors: _baseColors),
    );
  }

  Widget categoryList({List<String> categoryNames, List<Color> baseColors}) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: categoryNames.length,
      itemBuilder: (context, index) => Category(
        color: baseColors[index],
        icon: Icons.edit,
        text: categoryNames[index],
      ),
    );
  }
}
