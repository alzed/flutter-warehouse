import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  BMICard({@required this.color, @required this.child, this.onPress});

  final Color color;
  final Widget child;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: child,
      ),
    );
  }
}
