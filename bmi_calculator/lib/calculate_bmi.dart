import 'package:flutter/material.dart';
import 'dart:math';

class CalculateBMI {
  int height;
  int weight;
  double _bmi;

  CalculateBMI({@required this.height, @required this.weight}) {
    _bmi = this.weight / pow(this.height / 100, 2);
  }

  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getLabel() {
    if (_bmi > 25) {
      return 'Obese';
    }
    if (_bmi >= 18.5) {
      return 'Normal';
    }
    return 'Lean';
  }

  String getDescription() {
    if (_bmi > 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
