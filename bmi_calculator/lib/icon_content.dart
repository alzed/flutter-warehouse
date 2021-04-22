import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.color, this.icon, this.label});

  final Color color;
  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconTheme(
          data: IconThemeData(
            color: color,
            size: 60.0,
          ),
          child: icon,
        ),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
