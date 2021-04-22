import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({@required this.icon, @required this.color, @required this.text});

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    double categoryHeight = 100.0;
    double borderRadius = categoryHeight / 2;

    return Material(
      child: Container(
        height: categoryHeight,
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(borderRadius),
          highlightColor: color,
          splashColor: color,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  icon,
                  size: 60.0,
                ),
              ),
              Center(
                  child: Text(
                text,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
