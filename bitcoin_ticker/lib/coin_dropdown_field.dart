import 'package:flutter/material.dart';

class CoinDropdownField extends StatelessWidget {
  const CoinDropdownField({
    Key key,
    @required this.coin,
    @required this.coinColor,
    @required this.coinDropdownColor,
    @required this.coinList,
    @required this.coinUpdateFunction,
  }) : super(key: key);

  final String coin;
  final Color coinColor;
  final Color coinDropdownColor;
  final List<String> coinList;
  final Function coinUpdateFunction;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: coin,
        icon: Icon(
          Icons.arrow_drop_down,
          color: coinColor,
          size: 50.0,
        ),
        dropdownColor: coinDropdownColor,
        onChanged: (String coin) {
          coinUpdateFunction(coin);
        },
        items: coinList.map<DropdownMenuItem<String>>((String coin) {
          return DropdownMenuItem<String>(
            value: coin,
            child: Text(
              coin,
              style: TextStyle(
                color: coinColor,
                fontSize: 45.0,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
