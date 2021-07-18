import 'package:flutter/material.dart';
import 'package:flashchat/constants.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your password';
        }
        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: true,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: kFormFieldDecoration.copyWith(
        hintText: 'Password',
      ),
    );
  }
}
