import 'package:flutter/material.dart';

import 'converter_screen.dart';

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
      color: Colors.transparent,
      child: Container(
        height: categoryHeight,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConverterScreen(
                  category: text,
                  color: color,
                ),
              ),
            );
          },
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
