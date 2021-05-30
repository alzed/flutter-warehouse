import 'package:flutter/material.dart';

void main() {
  runApp(BitcoinTickerApp());
}

class BitcoinTickerApp extends StatelessWidget {
  const BitcoinTickerApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF1D3B53),
      ),
      home: Scaffold(
        body: Container(),
      ),
    );
  }
}
