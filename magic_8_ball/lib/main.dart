import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BallApp());
}

class BallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Magic 8 ball'),
        ),
        body: BallPage(),
      ),
    );
  }
}

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballId = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Image.asset('images/ball$ballId.png'),
        onPressed: () {
          setState(() {
            ballId = Random().nextInt(4) + 1;
          });
        },
      ),
    );
  }
}
