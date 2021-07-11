import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key key,
    this.color,
    @required this.content,
    @required this.onPressed,
  }) : super(key: key);

  final Color color;
  final String content;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 25.0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          padding: EdgeInsets.all(10.0),
          primary: color,
          elevation: 10.0,
        ),
        child: Text(
          content,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
