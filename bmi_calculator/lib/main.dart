import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF12163A),
        scaffoldBackgroundColor: Color(0xFF101538),
        accentColor: Color(0xFFFF0067),
      ),
      home: InputPage(),
    );
  }
}
