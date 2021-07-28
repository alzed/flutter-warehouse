import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  static AudioCache player = AudioCache();

  Expanded buildKey({color, audioId}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.white30),
        ),
        onPressed: () {
          player.play('note$audioId.wav');
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.purple, audioId: 1),
              buildKey(color: Colors.indigo, audioId: 2),
              buildKey(color: Colors.blue, audioId: 3),
              buildKey(color: Colors.teal, audioId: 4),
              buildKey(color: Colors.yellow, audioId: 5),
              buildKey(color: Colors.orange, audioId: 6),
              buildKey(color: Colors.red, audioId: 7),
            ],
          ),
        ),
      ),
    );
  }
}
