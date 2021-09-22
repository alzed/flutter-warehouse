import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'coin_dropdown_field.dart';
import 'value_input_field.dart';
import 'coin_converter.dart';

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
  void initState() {
    super.initState();
    bitcoinValue.text = '';
    currencyValue.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Color(0xFF1D3B53),
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CoinDropdownField(
                    coin: bitcoin,
                    coinColor: Colors.white,
                    coinDropdownColor: Color(0xFF1D3B53),
                    coinList: kCryptoList,
                    coinUpdateFunction: (coin) async {
                      String convertedValue = await CoinConverter()
                          .getConvertedRate(coin, currency, bitcoinValue.text);
                      setState(() {
                        bitcoin = coin;
                        currencyValue.text = convertedValue;
                      });
                    },
                  ),
                  ValueInputField(
                    valueController: bitcoinValue,
                    valueColor: Colors.white,
                    valueConverter: (value) async {
                      String convertedValue = await CoinConverter()
                          .getConvertedRate(bitcoin, currency, value);
                      setState(() {
                        currencyValue.text = convertedValue;
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
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CoinDropdownField(
                    coin: currency,
                    coinColor: Color(0xFF1D3B53),
                    coinDropdownColor: Colors.white,
                    coinList: kCurrenciesList,
                    coinUpdateFunction: (coin) async {
                      String convertedValue = await CoinConverter()
                          .getConvertedRate(coin, bitcoin, currencyValue.text);
                      setState(() {
                        currency = coin;
                        bitcoinValue.text = convertedValue;
                      });
                    },
                  ),
                  ValueInputField(
                    valueController: currencyValue,
                    valueColor: Color(0xFF1D3B53),
                    valueConverter: (value) async {
                      String convertedValue = await CoinConverter()
                          .getConvertedRate(currency, bitcoin, value);
                      setState(() {
                        bitcoinValue.text = convertedValue;
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
