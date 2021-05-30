import 'package:flutter/material.dart';

import 'coin_data.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key key}) : super(key: key);

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final bitcoinValue = TextEditingController();
  final currencyValue = TextEditingController();

  String bitcoin = kCryptoList[0];
  String currency = kCurrenciesList[0];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Color(0xFF1D3B53),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: bitcoin,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 40.0,
                      ),
                      dropdownColor: Color(0xFF1D3B53),
                      onChanged: (String coin) {
                        setState(() {
                          bitcoin = coin;
                        });
                      },
                      items: kCryptoList
                          .map<DropdownMenuItem<String>>((String coin) {
                        return DropdownMenuItem<String>(
                          value: coin,
                          child: Text(
                            coin,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  TextField(
                    controller: bitcoinValue,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: currency,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFF1D3B53),
                        size: 40.0,
                      ),
                      onChanged: (String coin) {
                        setState(() {
                          currency = coin;
                        });
                      },
                      items: kCurrenciesList
                          .map<DropdownMenuItem<String>>((String coin) {
                        return DropdownMenuItem<String>(
                          value: coin,
                          child: Text(
                            coin,
                            style: TextStyle(
                              color: Color(0xFF1D3B53),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  TextField(
                    controller: currencyValue,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
