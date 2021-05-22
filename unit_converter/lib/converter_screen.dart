import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  ConverterScreen({@required this.category, @required this.color});

  final String category;
  final Color color;

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: widget.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Input',
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {},
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: widget.color, width: 1.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: [],
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent)),
              child: RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.compare_arrows),
              ),
              onPressed: () {},
            ),
            InputDecorator(
              child: Text('100'),
              decoration: InputDecoration(
                labelText: 'Output',
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: widget.color, width: 1.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
