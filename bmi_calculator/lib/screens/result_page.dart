import 'package:flutter/material.dart';

import '../constants.dart';
import '../components/bmi_card.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiLabel,
      @required this.bmiValue,
      @required this.bmiDescription});

  final String bmiLabel;
  final String bmiValue;
  final String bmiDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BMICard(
                color: kCardButtonColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bmiLabel.toUpperCase(),
                        style: kBMILabelStyle,
                      ),
                      Text(
                        bmiValue,
                        style: kBMIValueStyle,
                      ),
                      Column(
                        children: [
                          Text(
                            'Normal BMI range:',
                            style: kTitleTextStyle,
                          ),
                          Text(
                            '18.5 - 25 kg/m2',
                            style: kBMIDescriptionStyle,
                          ),
                        ],
                      ),
                      Text(
                        bmiDescription,
                        style: kBMIDescriptionStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: BottomButton(
              buttonText: 'RE-CALCULATE YOUR BMI',
              onPress: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
