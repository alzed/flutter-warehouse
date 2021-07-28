import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceId = 1;
  int rightDiceId = 1;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.white30),
      ),
      onPressed: () {
        setState(() {
          leftDiceId = Random().nextInt(6) + 1;
          rightDiceId = Random().nextInt(6) + 1;
        });
      },
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.white30),
                ),
                onPressed: () {
                  setState(() {
                    leftDiceId = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset('images/dice$leftDiceId.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.white30),
                ),
                onPressed: () {
                  setState(() {
                    rightDiceId = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset('images/dice$rightDiceId.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
