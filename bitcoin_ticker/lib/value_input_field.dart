import 'package:flutter/material.dart';

class ValueInputField extends StatelessWidget {
  const ValueInputField({
    Key key,
    @required this.valueController,
    @required this.valueColor,
    @required this.valueConverter,
  }) : super(key: key);

  final TextEditingController valueController;
  final Color valueColor;
  final Function valueConverter;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: valueController,
      style: TextStyle(
        color: valueColor,
        fontSize: 60,
      ),
      textAlign: TextAlign.center,
      cursorColor: valueColor,
      keyboardType: TextInputType.number,
      maxLength: 10,
      decoration: InputDecoration(
          counterText: '', border: InputBorder.none, hintText: '0'),
      onChanged: (value) {
        valueConverter(value);
      },
    );
  }
}
