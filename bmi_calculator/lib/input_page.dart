import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'bmi_card.dart';
import 'icon_content.dart';
import 'round_icon_button.dart';
import 'bottom_button.dart';
import 'result_page.dart';
import 'calculate_bmi.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 170;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: BMICard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: kCardButtonColor,
                      child: IconContent(
                        color: selectedGender == Gender.male
                            ? Colors.white
                            : Colors.white70,
                        icon: Icon(FontAwesomeIcons.mars),
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMICard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: kCardButtonColor,
                      child: IconContent(
                        color: selectedGender == Gender.female
                            ? Colors.white
                            : Colors.white70,
                        icon: Icon(FontAwesomeIcons.venus),
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: BMICard(
                color: kCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kTitleTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kValueTextStyle,
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 1.0,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white70,
                          thumbColor: kBottomContainerColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 28.0),
                          overlayColor: kBottomContainerColor.withAlpha(40),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: BMICard(
                      color: kCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kTitleTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kValueTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                icon: Icon(FontAwesomeIcons.minus),
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: Icon(FontAwesomeIcons.plus),
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMICard(
                      color: kCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'AGE',
                            style: kTitleTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kValueTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                icon: Icon(FontAwesomeIcons.minus),
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: Icon(FontAwesomeIcons.plus),
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: BottomButton(
              buttonText: 'CALCULATE YOUR BMI',
              onPress: () {
                CalculateBMI bmi = CalculateBMI(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiLabel: bmi.getLabel(),
                      bmiValue: bmi.getBMI(),
                      bmiDescription: bmi.getDescription(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
