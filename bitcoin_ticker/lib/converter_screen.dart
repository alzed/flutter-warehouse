import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'coin_dropdown_field.dart';
import 'value_input_field.dart';

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CoinDropdownField(
                    coin: bitcoin,
                    coinColor: Colors.white,
                    coinDropdownColor: Color(0xFF1D3B53),
                    coinList: kCryptoList,
                    coinUpdateFunction: (coin) {
                      setState(() {
                        bitcoin = coin;
                      });
                    },
                  ),
                  ValueInputField(
                    valueController: bitcoinValue,
                    valueColor: Colors.white,
                    valueConverter: (value) {
                      setState(() {
                        currencyValue.text = bitcoinValue.text;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CoinDropdownField(
                    coin: currency,
                    coinColor: Color(0xFF1D3B53),
                    coinDropdownColor: Colors.white,
                    coinList: kCurrenciesList,
                    coinUpdateFunction: (coin) {
                      setState(() {
                        currency = coin;
                      });
                    },
                  ),
                  ValueInputField(
                    valueController: currencyValue,
                    valueColor: Color(0xFF1D3B53),
                    valueConverter: (value) {
                      setState(() {
                        bitcoinValue.text = currencyValue.text;
                      });
                    },
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
