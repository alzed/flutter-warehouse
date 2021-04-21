import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(),
                ),
                Expanded(
                  child: BMICard(),
                ),
              ],
            ),
          ),
          Expanded(
            child: BMICard(),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(),
                ),
                Expanded(
                  child: BMICard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BMICard extends StatelessWidget {
  const BMICard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF272A4D),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
