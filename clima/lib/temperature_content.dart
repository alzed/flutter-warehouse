import 'package:flutter/material.dart';

class TemperatureContent extends StatelessWidget {
  const TemperatureContent({
    Key key,
    @required this.value,
    @required this.title,
    this.color,
  }) : super(key: key);

  final String value;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 60.0,
                color: color,
              ),
            ),
            Text(
              '°C',
              style: TextStyle(
                fontSize: 30.0,
                color: color,
              ),
            ),
          ],
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.0, color: color),
        )
      ],
    );
  }
}
