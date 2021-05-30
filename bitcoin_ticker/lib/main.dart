import 'package:flutter/material.dart';
import 'converter_screen.dart';

void main() {
  runApp(BitcoinTickerApp());
}

class BitcoinTickerApp extends StatelessWidget {
  const BitcoinTickerApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1D3B53),
        body: ConverterScreen(),
      ),
    );
  }
}
