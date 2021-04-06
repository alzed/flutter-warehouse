import 'riddle_bank.dart';

import 'package:flutter/material.dart';

RiddleBank riddles = RiddleBank();

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Quizzler'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreBoard = [];
  int score = 0;

  void checkAnswer(bool input) {
    setState(() {
      bool correctAnswer = riddles.getAnswer();
      if (input == correctAnswer) {
        score++;
        scoreBoard.add(Icon(
          Icons.done,
          color: Colors.green,
        ));
      } else {
        scoreBoard.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      riddles.next();
      if (riddles.isFinished()) {
        showFinished();
      }
    });
  }

  Future<void> showFinished() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Quiz Completed!'),
            content: Text('Your score is $score'),
            actions: [
              TextButton(
                child: Text('Done'),
                onPressed: () {
                  setState(() {
                    scoreBoard.clear();
                    score = 0;
                    Navigator.pop(context);
                  });
                },
              ),
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 7,
          child: Center(
            child: Text(
              riddles.getQuestion(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text(
                'TRUE',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.greenAccent[400]),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              child: Text(
                'FALSE',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: scoreBoard,
            ),
          ),
        ),
      ],
    );
  }
}
