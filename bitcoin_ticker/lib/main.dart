import 'package:flutter/material.dart';

void main() {
  runApp(BitcoinTickerApp());
}

class BitcoinTickerApp extends StatelessWidget {
  const BitcoinTickerApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(),
        backgroundColor: Color(0xFF1D3B53),
      ),
    );
  }
}
