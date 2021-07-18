import 'package:flutter/material.dart';
import 'package:flashchat/constants.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    Key key,
    @required this.onChanged,
  }) : super(key: key);

  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter your email';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      onChanged: onChanged,
      decoration: kFormFieldDecoration.copyWith(
        hintText: 'Email',
      ),
    );
  }
}
