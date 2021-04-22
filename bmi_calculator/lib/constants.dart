import 'package:flutter/material.dart';

enum Gender { male, female }

Color kAppBarColor = Color(0xFF0A0D22);
Color kBackgroundColor = Color(0xFF0A0E21);
Color kCardButtonColor = Color(0xFF1D1E33);
Color kCardColor = Color(0xFF111428);
Color kBottomContainerColor = Color(0xFFEB1555);

TextStyle kTitleTextStyle = TextStyle(
  color: Colors.white70,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 2.0,
);

TextStyle kValueTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 2.0,
);

TextStyle kBMILabelStyle = TextStyle(
  color: Colors.greenAccent.shade400,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 2.0,
);

TextStyle kBMIValueStyle = TextStyle(
  color: Colors.white,
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 2.0,
);

TextStyle kBMIDescriptionStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  letterSpacing: 2.0,
  height: 2,
);
