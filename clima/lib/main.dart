import 'package:flutter/material.dart';

import 'weather_screen.dart';

void main() {
  runApp(ClimaApp());
}

class ClimaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: WeatherScreen(),
    );
  }
}
